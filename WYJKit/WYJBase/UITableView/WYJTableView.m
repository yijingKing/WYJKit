/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "WYJTableView.h"

@implementation WYJTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    self.delaysContentTouches = NO;
    self.canCancelContentTouches = YES;
    // Remove touch delay (since iOS 8)
    UIView *wrapView = self.subviews.firstObject;
    // UITableViewWrapperView
    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
            // UIScrollViewDelayedTouchesBeganGestureRecognizer
            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                gesture.enabled = NO;
                break;
            }
        }
    }
    return self;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ([view isKindOfClass:[UIControl class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
