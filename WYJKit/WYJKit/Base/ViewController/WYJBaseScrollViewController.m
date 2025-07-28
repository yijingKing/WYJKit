//
//  WYJBaseScrollViewController.m
//  LCProduct
//
//  Created by 祎 on 2025/1/10.
//

#import "WYJBaseScrollViewController.h"
#import <Masonry/Masonry.h>
@interface WYJBaseScrollViewController ()


@end

@implementation WYJBaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView = [UIScrollView new];
    self.scrollView.backgroundColor = UIColor.clearColor;
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.nav_bar_view.mas_bottom);
        make.bottom.mas_equalTo(self.view);
    }];
    [self.scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.scrollView);
        make.width.mas_equalTo(self.scrollView);
    }];
}

- (void)setScrollEdge:(UIEdgeInsets)scrollEdge {
    _scrollEdge = scrollEdge;
    [self.scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(scrollEdge.left);
        make.top.mas_equalTo(scrollEdge.top);
        make.right.mas_equalTo(scrollEdge.right);
        make.bottom.mas_equalTo(scrollEdge.bottom);
    }];
}

- (void)yi_addSubview:(UIView *)view {
    self.contentView.hidden = YES;
    [self.scrollView addSubview:view];
}

- (void)setScrollViewHeight:(double)scrollViewHeight {
    _scrollViewHeight = scrollViewHeight;
    self.scrollView.contentOffset = CGPointMake(0, scrollViewHeight);
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = UIColor.clearColor;
    }
    return _contentView;
}

@end
