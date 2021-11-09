/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "WYJBaseCollectionViewDelegate.h"

@implementation WYJBaseCollectionViewDelegate
#pragma mark UICollectionViewDataSource {
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.numberOfSectionsInCollectionView) {
        return self.numberOfSectionsInCollectionView(collectionView);
    }
    return 0;
}
//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (self.numberOfItemsInSection) {
        return self.numberOfItemsInSection(collectionView,section);
    }
    return 0;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cellForItemAtIndexPath) {
        return self.cellForItemAtIndexPath(collectionView,indexPath);
    }
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    return cell;
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (self.referenceSizeForHeaderInSection) {
        self.referenceSizeForHeaderInSection(collectionView,collectionViewLayout,section);
    }
    return CGSizeZero;
}
//返回尾footerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (self.referenceSizeForFooterInSection) {
        self.referenceSizeForFooterInSection(collectionView,collectionViewLayout,section);
    }
    return CGSizeZero;
}

//对头视图或者尾视图进行设置
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (self.viewForSupplementaryElementOfKind) {
        self.viewForSupplementaryElementOfKind(collectionView,kind,indexPath);
    }
    return nil;
}
//定义每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.sizeForItemAtIndexPath) {
        return self.sizeForItemAtIndexPath(collectionView,collectionViewLayout,indexPath);
    }
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width)/2 - 2, (([UIScreen mainScreen].bounds.size.width)/2 - 2)*1.6);
}
//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (self.insetForSectionAtIndex) {
        return self.insetForSectionAtIndex(collectionView,collectionViewLayout,section);
    }
    return UIEdgeInsetsMake(0.0,2.0,0.0,2.0);
}
//每个item之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (self.minimumInteritemSpacingForSectionAtIndex) {
        return self.minimumInteritemSpacingForSectionAtIndex(collectionView,collectionViewLayout,section);
    }
    return 0.0f;
}
//每个section中不同的item之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (self.minimumLineSpacingForSectionAtIndex) {
        return self.minimumLineSpacingForSectionAtIndex(collectionView,collectionViewLayout,section);
    }
    return 0.0f;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.didSelectItemAtIndexPath) {
        self.didSelectItemAtIndexPath(collectionView,indexPath);
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.willDisplayCell) {
        self.willDisplayCell(collectionView, cell, indexPath);
    }
    
}
@end
