/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN


typedef NSInteger(^NumberOfSectionsInCollectionView)(UICollectionView * collectionView);
typedef NSInteger(^NumberOfItemsInSection)(UICollectionView * collectionView,NSInteger section);

typedef UICollectionViewCell*_Nullable(^CellForItemAtIndexPath)(UICollectionView * _Nullable collectionView, NSIndexPath * _Nullable  indexPath);
typedef void(^DidSelectItemAtIndexPath)(UICollectionView * _Nullable collectionView, NSIndexPath * _Nullable  indexPath);

typedef CGFloat(^ReferenceSizeForHeaderInSection)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);
typedef CGFloat(^ReferenceSizeForFooterInSection)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);
typedef UICollectionReusableView*_Nullable(^ViewForSupplementaryElementOfKind)(UICollectionView * collectionView,NSString * kind,NSIndexPath * indexPath);

typedef CGSize(^SizeForItemAtIndexPath)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSIndexPath * indexPath);

typedef UIEdgeInsets(^InsetForSectionAtIndex)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);

typedef CGFloat(^MinimumInteritemSpacingForSectionAtIndex)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);
typedef CGFloat(^MinimumLineSpacingForSectionAtIndex)(UICollectionView * collectionView,UICollectionViewLayout * layout,NSInteger section);
@interface WYJBaseCollectionViewDelegate : NSObject<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic, copy)NumberOfSectionsInCollectionView numberOfSectionsInCollectionView;
@property (nonatomic, copy)NumberOfItemsInSection numberOfItemsInSection;
@property (nonatomic, copy)CellForItemAtIndexPath cellForItemAtIndexPath;
@property (nonatomic, copy)DidSelectItemAtIndexPath didSelectItemAtIndexPath;

@property (nonatomic, copy)ReferenceSizeForHeaderInSection referenceSizeForHeaderInSection;
@property (nonatomic, copy)ReferenceSizeForFooterInSection referenceSizeForFooterInSection;
@property (nonatomic, copy)ViewForSupplementaryElementOfKind viewForSupplementaryElementOfKind;
@property (nonatomic, copy)SizeForItemAtIndexPath sizeForItemAtIndexPath;

@property (nonatomic, copy)InsetForSectionAtIndex insetForSectionAtIndex;
@property (nonatomic, copy)MinimumInteritemSpacingForSectionAtIndex minimumInteritemSpacingForSectionAtIndex;
@property (nonatomic, copy)MinimumLineSpacingForSectionAtIndex minimumLineSpacingForSectionAtIndex;
@end

NS_ASSUME_NONNULL_END
