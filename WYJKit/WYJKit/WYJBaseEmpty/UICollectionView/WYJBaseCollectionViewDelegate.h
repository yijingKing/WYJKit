/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN


typedef NSInteger(^WYJNumberOfSectionsInCollectionView)(UICollectionView * collectionView);
typedef NSInteger(^WYJNumberOfItemsInSection)(UICollectionView * collectionView,NSInteger section);

typedef UICollectionViewCell*_Nullable(^WYJCellForItemAtIndexPath)(UICollectionView * _Nullable collectionView, NSIndexPath * _Nullable  indexPath);
typedef void(^WYJDidSelectItemAtIndexPath)(UICollectionView * _Nullable collectionView, NSIndexPath * _Nullable  indexPath);

typedef CGFloat(^WYJReferenceSizeForHeaderInSection)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);
typedef CGFloat(^WYJReferenceSizeForFooterInSection)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);
typedef UICollectionReusableView*_Nullable(^WYJViewForSupplementaryElementOfKind)(UICollectionView * collectionView,NSString * kind,NSIndexPath * indexPath);

typedef CGSize(^WYJSizeForItemAtIndexPath)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSIndexPath * indexPath);

typedef UIEdgeInsets(^WYJInsetForSectionAtIndex)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);

typedef CGFloat(^WYJMinimumInteritemSpacingForSectionAtIndex)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);
typedef CGFloat(^WYJMinimumLineSpacingForSectionAtIndex)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);

typedef void(^WYJWillDisplayCollectionViewCell)(UICollectionView * _Nullable collectionView,UICollectionViewCell * cell, NSIndexPath * _Nullable  indexPath);

@interface WYJBaseCollectionViewDelegate : NSObject<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, copy)WYJNumberOfSectionsInCollectionView numberOfSectionsInCollectionView;
@property (nonatomic, copy)WYJNumberOfItemsInSection numberOfItemsInSection;
@property (nonatomic, copy)WYJCellForItemAtIndexPath cellForItemAtIndexPath;
@property (nonatomic, copy)WYJDidSelectItemAtIndexPath didSelectItemAtIndexPath;

@property (nonatomic, copy)WYJReferenceSizeForHeaderInSection referenceSizeForHeaderInSection;
@property (nonatomic, copy)WYJReferenceSizeForFooterInSection referenceSizeForFooterInSection;
@property (nonatomic, copy)WYJViewForSupplementaryElementOfKind viewForSupplementaryElementOfKind;
@property (nonatomic, copy)WYJSizeForItemAtIndexPath sizeForItemAtIndexPath;

@property (nonatomic, copy)WYJInsetForSectionAtIndex insetForSectionAtIndex;
@property (nonatomic, copy)WYJMinimumInteritemSpacingForSectionAtIndex minimumInteritemSpacingForSectionAtIndex;
@property (nonatomic, copy)WYJMinimumLineSpacingForSectionAtIndex minimumLineSpacingForSectionAtIndex;

@property (nonatomic, copy)WYJWillDisplayCollectionViewCell willDisplayCell;
@end

NS_ASSUME_NONNULL_END
