//
//  WYJBaseScrollViewViewController.m
//  LCProduct
//
//  Created by 祎 on 2025/1/10.
//

#import "WYJBaseScrollViewViewController.h"
#import <Masonry/Masonry.h>
@interface WYJBaseScrollViewViewController ()


@end

@implementation WYJBaseScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView = [UIScrollView new];
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.nav_bar_view.mas_bottom);
        make.bottom.mas_equalTo(self.view);
    }];
    
    
    
    
}

- (void)yi_addSubview:(UIView *)view {
    [self.scrollView addSubview:view];
}

- (void)setScrollViewHeight:(double)scrollViewHeight {
    _scrollViewHeight = scrollViewHeight;
    self.scrollView.contentOffset = CGPointMake(0, scrollViewHeight);
}


@end
