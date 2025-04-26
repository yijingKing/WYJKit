/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJBaseViewController.h"
#import "WYJKitHeader.h"
#import <MJRefresh/MJRefresh.h>
@interface WYJBaseViewController ()

@property(nonatomic, copy)void (^block)(UIImage *);
/// //判断是否加载中
@property (nonatomic ,assign)BOOL isLoading;


@property (nonatomic, strong) UILabel * lab_base_title;

@property (nonatomic, strong) UIButton * left_base_btn;

@property (nonatomic, strong) UIView * empty_view;

@property (nonatomic, strong) UIImageView * empty_imageV;
@property (nonatomic, strong) UILabel * empty_label;
@end

@implementation WYJBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"当前控制器---%@",self.class);
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = NO;
    [self.view bringSubviewToFront:self.nav_base_view];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.nav_hidden = NO;
}
- (void)injected{
    NSLog(@"injected--%@",self);
    [self viewDidLoad];
}
- (void)dealloc {
    NSLog(@"控制器-->%@  释放", [self class]);
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"kNotiReloadVCData" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //防止自动下移64
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
    // 防止返回手势失效
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    if (!self.nav_hidden) {
        [self.view addSubview:self.nav_base_view];
    }
    
    [self initChildView];
    [self setupUI];
    [self setupConstraints];
}
- (void)setNav_hidden:(BOOL)nav_hidden {
    _nav_hidden = nav_hidden;
    self.nav_base_view.hidden = nav_hidden;
}
#pragma make --- 系统配置 ---
- (void)setBarStyle:(UIStatusBarStyle)barStyle {
    _barStyle = barStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.barStyle;
}

- (void)setStatusBarTitleWhite:(BOOL)statusBarTitleWhite {
    _statusBarTitleWhite = statusBarTitleWhite;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)setOpen_noti_reload:(BOOL)open_noti_reload {
    _open_noti_reload = open_noti_reload;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadViewData) name:@"kNotiReloadVCData" object:nil];
}

- (void)startNotiReloadData {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotiReloadVCData" object:nil];
}

- (void)setN_title:(NSString *)n_title {
    _n_title = n_title;
    [self setNavTitle:n_title];
}

- (void)setNavTitle:(NSString *)title {
    self.lab_base_title.text = title;
    [self.lab_base_title sizeToFit];
    self.lab_base_title.width = YJRatio(200);
    CGPoint center = CGPointMake(self.nav_bar_view.width / 2, self.nav_bar_view.height / 2);
    self.lab_base_title.center = center;
}
- (void)setBackImage:(UIImage *)image {
    [self.left_base_btn setImage:image forState:UIControlStateNormal];
}
- (void)setBackBtnImage:(NSString *)image {
    [self.left_base_btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
}
- (void)setN_backgroundColor:(UIColor *)n_backgroundColor {
    _nav_base_view.backgroundColor = n_backgroundColor;
}
- (void)setN_titleColor:(UIColor *)n_titleColor {
    self.lab_base_title.textColor = n_titleColor;
}
- (void)initChildView {
    
}

- (void)requestData {
    
}

- (void)reloadViewData {
    
}
- (void)setupUI {
    
}
- (void)setupConstraints {
    
}

- (UIView *)nav_base_view {
    if (!_nav_base_view) {
        _nav_base_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YJSCREEN_WIDTH, YJStatusAndNavHeight)];
        _nav_base_view.backgroundColor = WHexColor(#FFFFFF);
        [_nav_base_view addSubview:self.nav_bar_view];
    }
    return _nav_base_view;
}

- (UIView *)nav_bar_view {
    if (!_nav_bar_view) {
        _nav_bar_view = [[UIView alloc] initWithFrame:CGRectMake(0, YJStatusHeight, YJSCREEN_WIDTH, YJNavBarHeight)];
        _nav_bar_view.backgroundColor = UIColor.clearColor;
        [_nav_bar_view addSubview:self.lab_base_title];
        NSLog(@"%zi", self.navigationController.childViewControllers.count);
    }
    if (self.navigationController.viewControllers.count > 1) {
        [self.left_base_btn setImage:[UIImage imageNamed:@"nav_back_black"] forState:UIControlStateNormal];
        self.left_base_btn.frame = CGRectMake(0, 0, YJNavBarHeight, YJNavBarHeight);
        [_nav_bar_view addSubview:self.left_base_btn];
    }
    return _nav_bar_view;
}

- (UIButton *)left_base_btn {
    if (!_left_base_btn) {
        _left_base_btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_left_base_btn addTarget:self action:@selector(onBackAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _left_base_btn;
}

- (void)onBackAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIButton *)right_base_btn {
    if (!_right_base_btn) {
        _right_base_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _right_base_btn;
}

- (void)setRightBtnTitle:(NSString *)title block:(void (^)(UIButton *btn))block {
    [self setRightBtnTitle:title color:WHexColor(#222222) fontSize:13 block:block];
}

- (void)setRightBtnTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize block:(void(^)(UIButton *btn))block {
    @weakify(self);
    NSDictionary * attr = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium],
                            NSForegroundColorAttributeName : color
    };
    NSAttributedString * attr_title = [[NSAttributedString alloc] initWithString:title attributes:attr];
    CGSize size = [attr_title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    [self.nav_bar_view addSubview:self.right_base_btn];
    [self.right_base_btn setImage:nil forState:UIControlStateNormal];

    [self.right_base_btn setAttributedTitle:attr_title forState:UIControlStateNormal];
    [self.right_base_btn setFrame:CGRectMake(YJSCREEN_WIDTH - size.width - 26, 0, size.width + 26, YJNavBarHeight)];
    [self.right_base_btn yi_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        @strongify(self);
        block(self.right_base_btn);
    }];
}

- (void)setRightBtnImage:(NSString *)image block:(void (^)(UIButton *btn))block {
    @weakify(self);
    if (!_right_base_btn) {
        [self.nav_bar_view addSubview:self.right_base_btn];
    }
    [self.right_base_btn setTitle:@"" forState:UIControlStateNormal];

    [self.right_base_btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    self.right_base_btn.frame = CGRectMake(YJSCREEN_WIDTH - YJNavBarHeight, 0, YJNavBarHeight, YJNavBarHeight);

    [self.right_base_btn yi_addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        @strongify(self);
        block(self.right_base_btn);
    }];
}

- (UILabel *)lab_base_title {
    if (!_lab_base_title) {
        _lab_base_title = [[UILabel alloc] init];
        _lab_base_title.font = [UIFont systemFontOfSize:17 weight:UIFontWeightBold];
        _lab_base_title.textColor = WHexColor(#333333);
        _lab_base_title.textAlignment = NSTextAlignmentCenter;
    }
    return _lab_base_title;
}

- (void)openHeaderRefresh:(void (^)(void))block {
    if (self.scrollView) {
        self.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            block();
        }];
    }else {
        NSLog(@"不存在 scrollView, 无法开启刷新");
    }
}

- (void)openLoadMore:(void (^)(void))block {
    if (self.scrollView) {
        self.scrollView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            block();
        }];
    }else {
        NSLog(@"不存在 scrollView, 无法开启刷新");
    }
}

- (void)endHeaderRefresh {
    [self.scrollView.mj_header endRefreshing];
    [self.scrollView.mj_footer resetNoMoreData];
}

- (void)endRefresh:(NSInteger)currentPage maxPage:(NSInteger)maxPage {
    if (currentPage == 1) {
        [self endHeaderRefresh];
    }
    if (currentPage < maxPage) {
        [self.scrollView.mj_footer endRefreshing];
    }else {
        [self.scrollView.mj_footer endRefreshingWithNoMoreData];
    }
}

- (void)popVC {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushVC:(UIViewController *)vc {
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)destructionCount:(NSInteger)count pushVC:(UIViewController *)vc {
    [self pushVC:vc];
    NSInteger total_count = self.navigationController.viewControllers.count;
    if (total_count > 2) {
        NSMutableArray * vcs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        for (int i = 0; i < count; i++) {
            if (self.navigationController.viewControllers.count > 2) {
                [vcs removeObjectAtIndex:total_count - 2 - i];
            }else {
                break;
            }
        }
        self.navigationController.viewControllers = vcs;
    }
}




@end

