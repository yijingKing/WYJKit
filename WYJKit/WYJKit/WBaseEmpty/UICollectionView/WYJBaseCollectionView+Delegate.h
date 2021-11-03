/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "WYJBaseCollectionView.h"
#import "WYJBaseCollectionViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN
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
