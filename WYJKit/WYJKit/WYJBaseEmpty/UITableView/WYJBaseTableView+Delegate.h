/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <UIKit/UIKit.h>

#import "WYJBaseTableView.h"
#import "WYJBaseTableViewDelegate.h"
NS_ASSUME_NONNULL_BEGIN


@interface WYJBaseTableView (Delegate)
#pragma make ------ 区数 ------
///区数
- (void)numberForSection:(WYJNumberForSection)numberForSectionBlock;
#pragma make ------ 行数 ------
///行数
- (void)numberOfRowsInSection:(WYJNumberOfRowsInSection)numberOfRowsInSection;
#pragma make ------ 行高 ------
///行高
- (void)heightForRowAtIndexPath:(WYJHeightForRowAtIndexPath)heightForRowAtIndexPath;
#pragma make ------ cell ------
///cell
- (void)cellForRowAtIndexPath:(WYJCellForRowAtIndexPath)cellForRowAtIndexPath;

- (void)willDisplayCell:(WYJWillDisplayCell)willDisplayCell;
#pragma make ------ 点击 ------
///点击
- (void)didSelectRowAtIndexPath:(WYJDidSelectRowAtIndexPath)didSelectRowAtIndexPath;
#pragma make ------ 区头 ------
///区头高
- (void)heightForHeaderInSection:(WYJHeightForHeaderInSection)heightForHeaderInSection;
///区头视图
- (void)viewForHeaderInSection:(WYJViewForHeaderInSection)viewForHeaderInSection;
#pragma make ------ 区尾 ------
///区尾高
- (void)heightForFooterInSection:(WYJHeightForFooterInSection)heightForFooterInSection;
///区尾视图
- (void)viewForFooterInSection:(WYJViewForFooterInSection)viewForFooterInSection;

@end

NS_ASSUME_NONNULL_END
