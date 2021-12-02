/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJNavigationView.h"
#import "WYJKitHeader.h"
#import <Masonry/Masonry.h>
@interface WYJNavigationView ()
/// 返回按钮
@property (nonatomic,strong) UIButton *backButton;

@end

@implementation WYJNavigationView
- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self addSubview:self.backButton];
        [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.bottom.mas_equalTo(self);
            make.width.mas_equalTo(kRatioSize(44));
        }];
    }
    return self;
}
/// 左侧钮
/// @param size 大小
/// @param image 图片
/// @param title 文本
- (void)setLeftItemWithSize:(CGSize *)size image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor {
    
}

#pragma mark - Lazy loading
- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"nav_back_black"] forState:normal];
        _backButton.yi_titleText = @" ";
    }
    return _backButton;
}




@end
