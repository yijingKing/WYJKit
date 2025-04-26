//
//  WYJBaseScrollViewViewController.h
//  LCProduct
//
//  Created by 祎 on 2025/1/10.
//

#import "WYJBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseScrollViewViewController : WYJBaseViewController
/// scrollView height
@property (nonatomic,assign) double scrollViewHeight;

- (void)yi_addSubview:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
