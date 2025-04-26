//
//  WYJBasePopView.m
//  LCProduct
//
//  Created by 祎 on 2025/3/18.
//

#import "WYJBasePopView.h"
#import "WYJFrameMacro.h"
#import "NSObject+WYJWindow.h"

@interface WYJBasePopView ()

@property (nonatomic, strong) LSTPopView *popView;

@end

@implementation WYJBasePopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化 LSTPopView
        _popView = [LSTPopView initWithCustomView:[self setupUI]
                                       parentView:YJKeyWindow.rootViewController.view
                                         popStyle:LSTPopStyleSmoothFromBottom
                                     dismissStyle:LSTDismissStyleSmoothToBottom];
    }
    return self;
}

- (UIView *)setupUI {
    return UIView.new;
}

- (void)pop {
    [self.popView pop];
}

- (void)dismiss {
    [self.popView dismiss];
    if (self.popView.popViewDidDismissBlock) {
        self.popView.popViewDidDismissBlock();
    }
}
- (NSInteger)priority {
    return 0;
}
@end
