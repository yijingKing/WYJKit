/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/
#import "WYJBaseTableView+Delegate.h"

@implementation WYJBaseTableView (Delegate)

- (void)numberForSection:(WYJNumberForSection)numberForSectionBlock {
    self.baseDelegate.numberForSectionBlock = numberForSectionBlock;
}
- (void)numberOfRowsInSection:(WYJNumberOfRowsInSection)numberOfRowsInSection {
    self.baseDelegate.numberOfRowsInSection = numberOfRowsInSection;
}
- (void)cellForRowAtIndexPath:(WYJCellForRowAtIndexPath)cellForRowAtIndexPath {
    self.baseDelegate.cellForRowAtIndexPath = cellForRowAtIndexPath;
}
- (void)didSelectRowAtIndexPath:(WYJDidSelectRowAtIndexPath)didSelectRowAtIndexPath {
    self.baseDelegate.didSelectRowAtIndexPath = didSelectRowAtIndexPath;
}
- (void)heightForRowAtIndexPath:(WYJHeightForRowAtIndexPath)heightForRowAtIndexPath {
    self.baseDelegate.heightForRowAtIndexPath = heightForRowAtIndexPath;
}
- (void)heightForHeaderInSection:(WYJHeightForHeaderInSection)heightForHeaderInSection {
    self.baseDelegate.heightForHeaderInSection = heightForHeaderInSection;
}
- (void)heightForFooterInSection:(WYJHeightForFooterInSection)heightForFooterInSection {
    self.baseDelegate.heightForFooterInSection = heightForFooterInSection;
}
- (void)viewForHeaderInSection:(WYJViewForHeaderInSection)viewForHeaderInSection {
    self.baseDelegate.viewForHeaderInSection = viewForHeaderInSection;
}
- (void)viewForFooterInSection:(WYJViewForFooterInSection)viewForFooterInSection {
    self.baseDelegate.viewForFooterInSection = viewForFooterInSection;
}
- (void)willDisplayCell:(WYJWillDisplayCell)willDisplayCell {
    self.baseDelegate.willDisplayCell = willDisplayCell;
}
@end
