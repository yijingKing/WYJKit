/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import <UIKit/UIKit.h>

#import "WYJBaseTableView.h"
#import "WYJBaseTableViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN


@interface WYJBaseTableView (Delegate)
#pragma make ------ 区数 ------
///区数
- (void)yi_numberForSection:(WYJNumberForSection)numberForSectionBlock;
#pragma make ------ 行数 ------
///行数
- (void)yi_numberOfRowsInSection:(WYJNumberOfRowsInSection)numberOfRowsInSection;
#pragma make ------ 行高 ------
///行高
- (void)yi_heightForRowAtIndexPath:(WYJHeightForRowAtIndexPath)heightForRowAtIndexPath;
#pragma make ------ cell ------
///cell
- (void)yi_cellForRowAtIndexPath:(WYJCellForRowAtIndexPath)cellForRowAtIndexPath;

- (void)yi_willDisplayCell:(WYJWillDisplayCell)willDisplayCell;
#pragma make ------ 点击 ------
///点击
- (void)yi_didSelectRowAtIndexPath:(WYJDidSelectRowAtIndexPath)didSelectRowAtIndexPath;
#pragma make ------ 区头 ------
///区头高
- (void)yi_heightForHeaderInSection:(WYJHeightForHeaderInSection)heightForHeaderInSection;
///区头视图
- (void)yi_viewForHeaderInSection:(WYJViewForHeaderInSection)viewForHeaderInSection;
#pragma make ------ 区尾 ------
///区尾高
- (void)yi_heightForFooterInSection:(WYJHeightForFooterInSection)heightForFooterInSection;
///区尾视图
- (void)yi_viewForFooterInSection:(WYJViewForFooterInSection)viewForFooterInSection;

@end

NS_ASSUME_NONNULL_END
