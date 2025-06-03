//
//  WYJUploadImageView.h
//  WYJKit
//
//  Created by 祎 on 2024/9/15.
//

#import "WYJBaseView.h"
#import "BaseCollectionViewHeader.h"
#import "WYJBaseCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJUploadImageView : WYJBaseView
@property (nonatomic, assign) WYJHorizonalType horizonalType;
@property (nonatomic,strong) WYJBaseCollectionView *collectionView;
@property (nonatomic,strong) UIImage *addImage;
@property (nonatomic,strong) UIImage *addFullImage;
@property (nonatomic,copy) void (^resultBlock)(NSArray * array);
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,assign) CGSize size; 
@property (nonatomic,assign) double minimumLineSpacing;
@property (nonatomic,assign) double minimumInteritemSpacing;

/// 最大数
@property (nonatomic,assign) double maxCount;

@end

@interface WYJUploadAddCell: WYJBaseCollectionViewCell
@property (nonatomic,strong) UIImage *addImage;
@property (nonatomic,strong) UIImage *addFullImage;
@end

@interface WYJUploadImageCell: WYJBaseCollectionViewCell
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,copy) void (^deleteBlock)(void);

@end

NS_ASSUME_NONNULL_END
