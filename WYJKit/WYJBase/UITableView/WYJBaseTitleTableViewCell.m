/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJBaseTitleTableViewCell.h"
#import <Masonry/Masonry.h>
#import "WYJMacroHeader.h"
#import "UIColorHeader.h"
#import "UIFontHeader.h"
#import "UILabelHeader.h"

@implementation WYJBaseTitleTableViewCell

- (void)initBaseElement {
    [self.bgView addSubview:self.titLabel];
    [self.titLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(YJRatio(12));
        make.centerY.mas_equalTo(self.bgView);
        make.top.mas_equalTo(YJRatio(12));
    }];
    [self.bgView addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-YJRatio(12));
        make.centerY.mas_equalTo(self.bgView);
        make.left.mas_equalTo(self.titLabel.mas_right).offset(YJRatio(12));
    }];
    self.bgSpace = 0;
}
- (void)setShowNext:(BOOL)showNext {
    [super setShowNext:showNext];
    if (showNext) {
        [self.descLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.nextImageView.mas_left).offset(-YJRatio(4));
            make.centerY.mas_equalTo(self.bgView);
            make.left.mas_equalTo(self.titLabel.mas_right).offset(YJRatio(12));
        }];
    } else {
        [self.descLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-YJRatio(12));
            make.centerY.mas_equalTo(self.bgView);
            make.left.mas_equalTo(self.titLabel.mas_right).offset(YJRatio(12));
        }];
    }
}

- (UILabel *)titLabel {
    if (!_titLabel) {
        _titLabel = [UILabel yi_createWithText:@"" color:WHexColor(0x212121) font:WYJSysFontWithSizes(14)];
        [_titLabel setContentHuggingPriority:(UILayoutPriorityRequired) + 1 forAxis:(UILayoutConstraintAxisHorizontal)];
    }
    return _titLabel;
}
- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [UILabel yi_createWithText:@"" color:WHexColor(0x848484) font:WYJSysFontWithSizes(12)];
        _descLabel.textAlignment = NSTextAlignmentRight;
    }
    return _descLabel;
}
@end
