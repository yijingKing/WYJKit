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
- (void)numberForSection:(NumberForSection)numberForSectionBlock;
#pragma make ------ 行数 ------
- (void)numberOfRowsInSection:(NumberOfRowsInSection)numberOfRowsInSection;
#pragma make ------ cell ------
- (void)cellForRowAtIndexPath:(CellForRowAtIndexPath)cellForRowAtIndexPath;
#pragma make ------ 点击 ------
- (void)didSelectRowAtIndexPath:(DidSelectRowAtIndexPath)didSelectRowAtIndexPath;
#pragma make ------ 行高 ------
- (void)heightForRowAtIndexPath:(HeightForRowAtIndexPath)heightForRowAtIndexPath;
#pragma make ------ 区头 ------
- (void)heightForHeaderInSection:(HeightForHeaderInSection)heightForHeaderInSection;
- (void)viewForHeaderInSection:(ViewForHeaderInSection)viewForHeaderInSection;
#pragma make ------ 区尾 ------
- (void)heightForFooterInSection:(HeightForFooterInSection)heightForFooterInSection;
- (void)viewForFooterInSection:(ViewForFooterInSection)viewForFooterInSection;
@end

NS_ASSUME_NONNULL_END
