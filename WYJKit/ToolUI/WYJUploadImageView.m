//
//  WYJUploadImageView.m
//  WYJKit
//
//  Created by 祎 on 2024/9/15.
//

#import "WYJUploadImageView.h"
#import "WYJKitHeader.h"
#import <SDWebImage/SDWebImage.h>
#import <Masonry/Masonry.h>
@interface WYJUploadImageView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@end

@implementation WYJUploadImageView
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)initElement {
    self.backgroundColor = UIColor.whiteColor;
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    [self.collectionView reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count + 1 >= self.maxCount ? self.maxCount : self.dataSource.count + 1;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (self.width - 12 * 2) / 3;
    return CGSizeMake(width, width);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 12;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSource.count == indexPath.row) {
        WYJUploadAddCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WYJUploadAddCell" forIndexPath:indexPath];
        cell.addImage = self.addImage;
        return cell;
    }
    WYJUploadImageCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WYJUploadImageCell" forIndexPath:indexPath];
    cell.imageView.image = self.dataSource[indexPath.row];
    cell.deleteBlock = ^{
        [self.dataSource removeObject:self.dataSource[indexPath.row]];
        [self.collectionView reloadData];
        !self.resultBlock?:self.resultBlock(self.dataSource);
    };
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataSource.count == indexPath.row) {
        [WYJImagePickerManager.sharedManager presentImagePickerOptionsWithMaxImagesCount:self.maxCount - self.dataSource.count completion:^(NSArray<UIImage *> * _Nonnull images) {
            [self.dataSource addObjectsFromArray:images];
            [self.collectionView reloadData];
            !self.resultBlock?:self.resultBlock(self.dataSource);
        }];
    }
}

- (WYJBaseCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat width = (self.width - 12 * 2) / 3;
        layout.itemSize = CGSizeMake(width, width);
        _collectionView = [[WYJBaseCollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:WYJUploadAddCell.class forCellWithReuseIdentifier:@"WYJUploadAddCell"];
        [_collectionView registerClass:WYJUploadImageCell.class forCellWithReuseIdentifier:@"WYJUploadImageCell"];
    }
    return _collectionView;
}
@end

@interface WYJUploadAddCell ()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation WYJUploadAddCell

- (void)initElement {
    self.contentView.backgroundColor = WHexColor(0xf8f8f8);
    self.titleLabel = [UILabel yi_createWithText:@"上传图片" color:WHexColor(0x212121) font:WYJSysFontWithSizes(12)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"照相机"]];
    self.imageView.centerX = self.centerX;
    [self.contentView addSubview:self.imageView];
    self.layer.cornerRadius = YJRatio(8);
    self.layer.masksToBounds = YES;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(25);
    }];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(YJRatio(30));
        make.height.mas_equalTo(YJRatio(28));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(YJRatio(4));
    }];
}
- (void)setAddImage:(UIImage *)addImage {
    _addImage = addImage;
    self.imageView.image = addImage;
}

@end


@interface WYJUploadImageCell()
@property (nonatomic,strong) UIButton *deleteButton;

@end

@implementation WYJUploadImageCell

- (void)setUrl:(NSString *)url {
    _url = url;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (void)initElement {
    self.backgroundColor = WHexColor(0xf8f8f8);
    self.imageView = [[UIImageView alloc] init];
    self.imageView.frame = self.bounds;
    self.imageView.layer.cornerRadius = 4;
    self.imageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:self.imageView];
    self.deleteButton = [UIButton yi_createWithFrame:(CGRectZero) title:@"X" titleColor:UIColor.whiteColor];
    self.deleteButton.backgroundColor = WHexColor(0x333333);
    self.deleteButton.yi_titleFont = 12;
    [self addSubview:self.deleteButton];
    self.deleteButton.layer.cornerRadius = YJRatio(10);
    self.deleteButton.layer.masksToBounds = YES;
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_equalTo(0);
        make.width.height.mas_equalTo(YJRatio(20));
    }];
    @weakify(self);
    [self.deleteButton yi_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        @strongify(self);
        !self.deleteBlock?:self.deleteBlock();
    }];
}
@end
