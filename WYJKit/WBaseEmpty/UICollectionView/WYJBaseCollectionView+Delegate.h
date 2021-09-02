//
//  WYJBaseCollectionView+Delegate.h
//  YJKitDemo
//
//  Created by PZ-IMAC-1 on 2021/9/2.
//  Copyright © 2021 Eugene King. All rights reserved.
//

#import "WYJBaseCollectionView.h"
#import "WYJBaseCollectionViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN
//@property (nonatomic, copy)ReferenceSizeForFooterInSection referenceSizeForFooterInSection;
//@property (nonatomic, copy)ViewForSupplementaryElementOfKind viewForSupplementaryElementOfKind;
//@property (nonatomic, copy)SizeForItemAtIndexPath sizeForItemAtIndexPath;
//
//@property (nonatomic, copy)InsetForSectionAtIndex insetForSectionAtIndex;
//@property (nonatomic, copy)MinimumInteritemSpacingForSectionAtIndex minimumInteritemSpacingForSectionAtIndex;
//@property (nonatomic, copy)MinimumLineSpacingForSectionAtIndex minimumLineSpacingForSectionAtIndex;
@interface WYJBaseCollectionView (Delegate)
#pragma make ------ 区数 ------
///区数
- (void)numberOfSectionsInCollectionView:(NumberOfSectionsInCollectionView)numberOfSectionsInCollectionView;
#pragma make ------ 行数 ------
///行数
- (void)numberOfItemsInSection:(NumberOfItemsInSection)numberOfItemsInSection;
#pragma make ------ cell ------
///cell
- (void)cellForItemAtIndexPath:(CellForItemAtIndexPath)cellForItemAtIndexPath;
#pragma make ------ 点击 ------
///点击
- (void)didSelectItemAtIndexPath:(DidSelectItemAtIndexPath)didSelectItemAtIndexPath;
#pragma make ------  ------
///行高
- (void)sizeForItemAtIndexPath:(SizeForItemAtIndexPath)sizeForItemAtIndexPath;
#pragma make ------ 区头 ------
///区头高
- (void)referenceSizeForHeaderInSection:(ReferenceSizeForHeaderInSection)referenceSizeForHeaderInSection;
#pragma make ------ 区尾 ------
///区尾高
- (void)referenceSizeForFooterInSection:(ReferenceSizeForFooterInSection)referenceSizeForFooterInSection;
#pragma make ------ margin ------
///定义每个Section 的 margin
- (void)insetForSectionAtIndex:(InsetForSectionAtIndex)insetForSectionAtIndex;
#pragma make ------ 间距 ------
///每个item之间的间距
- (void)minimumInteritemSpacingForSectionAtIndex:(MinimumInteritemSpacingForSectionAtIndex)minimumInteritemSpacingForSectionAtIndex;
#pragma make ------ 每个section中不同的item之间的行间距 ------
///每个section中不同的item之间的行间距
- (void)minimumLineSpacingForSectionAtIndex:(MinimumLineSpacingForSectionAtIndex)minimumLineSpacingForSectionAtIndex;
#pragma make ------ 区视图 ------
///区视图
- (void)viewForSupplementaryElementOfKind:(ViewForSupplementaryElementOfKind)viewForSupplementaryElementOfKind;
@end

NS_ASSUME_NONNULL_END
