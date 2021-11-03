/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "WYJBaseTableView+Delegate.h"

@implementation WYJBaseTableView (Delegate)

- (void)numberForSection:(NumberForSection)numberForSectionBlock {
    self.baseDelegate.numberForSectionBlock = numberForSectionBlock;
}
- (void)numberOfRowsInSection:(NumberOfRowsInSection)numberOfRowsInSection {
    self.baseDelegate.numberOfRowsInSection = numberOfRowsInSection;
}
- (void)cellForRowAtIndexPath:(CellForRowAtIndexPath)cellForRowAtIndexPath {
    self.baseDelegate.cellForRowAtIndexPath = cellForRowAtIndexPath;
}
- (void)didSelectRowAtIndexPath:(DidSelectRowAtIndexPath)didSelectRowAtIndexPath {
    self.baseDelegate.didSelectRowAtIndexPath = didSelectRowAtIndexPath;
}
- (void)heightForRowAtIndexPath:(HeightForRowAtIndexPath)heightForRowAtIndexPath {
    self.baseDelegate.heightForRowAtIndexPath = heightForRowAtIndexPath;
}
- (void)heightForHeaderInSection:(HeightForHeaderInSection)heightForHeaderInSection {
    self.baseDelegate.heightForHeaderInSection = heightForHeaderInSection;
}
- (void)heightForFooterInSection:(HeightForFooterInSection)heightForFooterInSection {
    self.baseDelegate.heightForFooterInSection = heightForFooterInSection;
}
- (void)viewForHeaderInSection:(ViewForHeaderInSection)viewForHeaderInSection {
    self.baseDelegate.viewForHeaderInSection = viewForHeaderInSection;
}
- (void)viewForFooterInSection:(ViewForFooterInSection)viewForFooterInSection {
    self.baseDelegate.viewForFooterInSection = viewForFooterInSection;
}
@end
