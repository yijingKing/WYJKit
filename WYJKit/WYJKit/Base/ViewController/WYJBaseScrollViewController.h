//
//  WYJBaseScrollViewController.h
//  LCProduct
//
//  Created by 祎 on 2025/1/10.
//

#import "WYJBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseScrollViewController : WYJBaseViewController
@property (nonatomic, strong) UIScrollView * scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic,assign) UIEdgeInsets scrollEdge; 
/// scrollView height
@property (nonatomic,assign) double scrollViewHeight;
- (void)yi_addSubview:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
