/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "UIViewController+YJAdd.h"
#import "WYJNavigationButton.h"
#import <objc/runtime.h>

static const char itemKey;
static const char ritemKey;

static const char leftItemsKey;
static const char rightItemsKey;
//static const char titleItemsKey;

static const char NavBackgroundColorKey;
static const char HidderShadowKey;
static const char titleColorKey;
static const char BackgroundColorKey;
static const char EndEditKey;
static const char HiddenNavigationBarKey;
static const char AnimatedKey;

typedef void(^NavBlock)(void);

typedef void(^RightNavBlock)(void);

typedef void(^LeftNavItemsBlock)(NSInteger);

typedef void(^TitleNavItemsBlock)(void);
typedef void(^RightNavItemsBlock)(NSInteger);

@interface UIViewController ()

@property (nonatomic, assign) BOOL animated;

@end

@implementation UIViewController (YJAdd)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(at_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)at_viewWillAppear:(BOOL)animated {
    [self at_viewWillAppear:animated];
    self.animated = animated;
}

#pragma make ------ 导航返回按钮 ------
- (void)yi_setBackItem:(UIImage *)image {
    [self yi_setBackItem:image closeItem:image];
}

- (void)yi_showNavTitle:(NSString *)title backItem:(BOOL)show {
    [self yi_setNavTitle:title];
    if (show) {
        [self yi_setBackItem:[UIImage imageNamed:@"nav_back"] closeItem:[UIImage imageNamed:@"nav_close"]];
    }
    else {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = YES;
    }
}

- (void)yi_setBackItem:(UIImage *)image closeItem:(UIImage *)closeImage {
    if (self.navigationController.viewControllers.count == 1 && self.presentingViewController) {
        self.navigationItem.leftBarButtonItem = [self yi_navItemWithImage:closeImage
                                                                 title:(closeImage ? nil : @"ㄨ")
                                                                action:@selector(yi_goBack)];
    }
    else if ((self.navigationController.viewControllers.count > 1 || (!self.navigationController && !self.parentViewController))) {
        UIBarButtonItem *backItem = [self yi_navItemWithImage:image
                                                     title:(image ? nil : @"ㄑ")
                                                    action:@selector(yi_goBack)];
        self.navigationItem.leftBarButtonItems = @[backItem];
    }
    else {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = YES;
    }
    ((UIButton *)self.navigationItem.leftBarButtonItem.customView).contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}

#pragma make ------ 导航标题 ------
- (void)yi_setNavTitle:(NSString *)title {
    [self yi_setNavTitle:title color: self.yi_titleColor ? self.yi_titleColor : UIColor.blackColor];
}

- (void)yi_setNavTitle:(NSString *)title color:(UIColor *)color {
    self.navigationItem.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : color}];
}

- (void)yi_setNavTitleView:(UIView *)titleView {
    self.navigationItem.titleView = titleView;
}

#pragma mark -----  导航按钮 -----
- (UIBarButtonItem *)yi_navItemWithImage:(UIImage *)image action:(SEL)action {
    return [self yi_navItemWithImage:image title:nil color:nil action:action];
}

- (UIBarButtonItem *)yi_navItemWithTitle:(NSString *)title action:(SEL)action {
    return [self yi_navItemWithImage:nil title:title color:nil action:action];
}

- (UIBarButtonItem *)yi_navItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action {
    return [self yi_navItemWithImage:nil title:title color:color action:action];
}

- (UIBarButtonItem *)yi_navItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action {
    return [self yi_navItemWithImage:image title:title color:nil action:action];
}

- (UIBarButtonItem *)yi_navItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color action:(SEL)action {
    return [self yi_navItemWithImage:image title:title color:color target:self action:action];
}
- (UIBarButtonItem *)yi_navItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color target:(id)target action:(SEL)action {
    
    return [[UIBarButtonItem alloc] initWithCustomView:[WYJBarButton buttonWithImage:image title:title color:color target:target action:action]];
}



#pragma mark -----  导航 左按钮 -----
- (void)yi_setNavLeftItemWithImage:(UIImage *)image action:(SEL)action {
    [self yi_setNavLeftItemWithImage:image title:nil color:nil action:action];
}

- (void)yi_setNavLeftItemWithTitle:(NSString *)title action:(SEL)action {
    [self yi_setNavLeftItemWithImage:nil title:title color:nil action:action];
}

- (void)yi_setNavLeftItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action {
    [self yi_setNavLeftItemWithImage:nil title:title color:color action:action];
}

- (void)yi_setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action {
    [self yi_setNavLeftItemWithImage:image title:title color:nil action:action];
}

- (void)yi_setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color action:(SEL)action {
    WYJBarButton *button = [WYJBarButton buttonWithImage:image title:title color:color target:self action:action];
    button.frame = CGRectMake(10, 0, 44, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}
#pragma mark -----  导航 左按钮 多个 -----

- (void)yi_setNavLeftItemsWithImages:(NSArray<UIImage *> *)images action:(SEL)action {
    [self yi_setNavLeftItemsWithImages:images titles:nil color:nil action:action];
}

- (void)yi_setNavLeftItemsWithTitles:(NSArray<NSString *> *)titles action:(SEL)action {
    [self yi_setNavLeftItemsWithImages:nil titles:titles color:nil action:action];
}

- (void)yi_setNavLeftItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors action:(SEL)action {
    [self yi_setNavLeftItemsWithImages:nil titles:titles color:colors action:action];
}

- (void)yi_setNavLeftItemsWithImages:(NSArray<UIImage *> *)images actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &leftItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemsWithImages:images titles:nil color:nil action:@selector(leftItemsAction:)];
}

- (void)yi_setNavLeftItemsWithTitles:(NSArray<NSString *> *)titles actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &leftItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemsWithImages:nil titles:titles color:nil action:@selector(leftItemsAction:)];
}

- (void)yi_setNavLeftItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &leftItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemsWithImages:nil titles:titles color:colors action:@selector(leftItemsAction:)];
}

- (void)yi_setNavLeftItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &leftItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemsWithImages:images titles:titles color:colors action:@selector(leftItemsAction:)];
}

- (void)yi_setNavLeftItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors action:(SEL)action {
    NSUInteger count = 0;
    if (images.count > titles.count) {
        count = images.count;
    } else {
        count = titles.count;
    }
    NSMutableArray * items = NSMutableArray.array;
    for (NSInteger i = 0; i < count; i++) {
        UIBarButtonItem *buttonItem;
        if (images != nil) {
            if (titles != nil) {
                buttonItem = [self yi_navItemWithImage:images[i] title:titles[i] color:colors[i] action:action];
            } else {
                buttonItem = [self yi_navItemWithImage:images[i] title:nil color:nil action:action];
            }
        } else {
            buttonItem = [self yi_navItemWithImage:nil title:titles[i] color:colors[i] action:action];
        }
        buttonItem.tag = i;
        [items addObject:buttonItem];
    }
    self.navigationItem.leftBarButtonItems = items;
}
- (void)leftItemsAction:(WYJBarButton *)bar {
    [self.navigationItem.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.customView == bar) {
            LeftNavItemsBlock block = objc_getAssociatedObject(self, &leftItemsKey);
            block(idx);
        }
    }];
}


#pragma mark -----  导航 右按钮 -----
- (void)yi_setNavRightItemWithImage:(UIImage *)image action:(SEL)action {
    [self yi_setNavRightItemWithImage:image title:nil color:nil action:action];
}

- (void)yi_setNavRightItemWithTitle:(NSString *)title action:(SEL)action {
    [self yi_setNavRightItemWithImage:nil title:title color:nil action:action];
}

- (void)yi_setNavRightItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action {
    [self yi_setNavRightItemWithImage:nil title:title color:color action:action];
}

- (void)yi_setNavRightItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action {
    [self yi_setNavRightItemWithImage:image title:title color:nil action:action];
}

- (void)yi_setNavRightItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color action:(SEL)action {
    WYJBarButton *button = [WYJBarButton buttonWithImage:image title:title color:color target:self action:action];
    button.frame = CGRectMake(10, 0, 44, 44);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

/** 导航 左按钮 文 */
- (void)yi_setNavLeftItemWithTitle:(NSString *)title actionBlock:(void(^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemWithTitle:title action:@selector(navBlockAction)];
}

- (void)yi_setNavLeftItemWithTitle:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemWithTitle:title color:color action:@selector(navBlockAction)];
}

- (void)yi_setNavLeftItemWithImage:(UIImage *)image actionBlock:(void(^)(void))block; {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemWithImage:image action:@selector(navBlockAction)];
}

- (void)yi_setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemWithImage:image title:title action:@selector(navBlockAction)];
}

- (void)yi_setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color actionBlock:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavLeftItemWithImage:image title:title color:color action:@selector(navBlockAction)];
}

/** 导航 右按钮 文 */
- (void)yi_setNavRightItemWithTitle:(NSString *)title actionBlock:(void(^)(void))block{
    if (block) {
        objc_setAssociatedObject(self, &ritemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemWithTitle:title action:@selector(rightNavBlockAction)];
}

- (void)yi_setNavRightItemWithTitle:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block{
    if (block) {
        objc_setAssociatedObject(self, &ritemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemWithTitle:title color:color action:@selector(rightNavBlockAction)];
}

/** 导航 右按钮 图 */
- (void)yi_setNavRightItemWithImage:(UIImage *)image actionBlock:(void(^)(void))block{
    if (block) {
        objc_setAssociatedObject(self, &ritemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemWithImage:image action:@selector(rightNavBlockAction)];
}

- (void)yi_setNavRightItemWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemWithImage:image title:title action:@selector(rightNavBlockAction)];
}

- (void)yi_setNavRightItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color actionBlock:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemWithImage:image title:title color:color action:@selector(rightNavBlockAction)];
}


- (void)rightNavBlockAction {
    RightNavBlock block = objc_getAssociatedObject(self, &ritemKey);
    block();
}

- (void)navBlockAction {
    NavBlock block = objc_getAssociatedObject(self, &itemKey);
    block();
}

#pragma make ------ 多个右按钮 ------

- (void)yi_setNavRightItemsWithImages:(NSArray<UIImage *> *)images action:(SEL)action {
    [self yi_setNavRightItemsWithImages:images titles:nil color:nil action:action];
}

- (void)yi_setNavRightItemsWithTitles:(NSArray<NSString *> *)titles action:(SEL)action {
    [self yi_setNavRightItemsWithImages:nil titles:titles color:nil action:action];
}

- (void)yi_setNavRightItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors action:(SEL)action {
    [self yi_setNavRightItemsWithImages:nil titles:titles color:colors action:action];
}

- (void)yi_setNavRightItemsWithImages:(NSArray<UIImage *> *)images actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &rightItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemsWithImages:images titles:nil color:nil action:@selector(rightItemsAction:)];
}

- (void)yi_setNavRightItemsWithTitles:(NSArray<NSString *> *)titles actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &rightItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemsWithImages:nil titles:titles color:nil action:@selector(rightItemsAction:)];
}

- (void)yi_setNavRightItemsWithTitles:(NSArray<NSString *> *)titles colors:(NSArray<UIColor *> *)colors actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &rightItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemsWithImages:nil titles:titles color:colors action:@selector(rightItemsAction:)];
}
- (void)yi_setNavRightItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &rightItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self yi_setNavRightItemsWithImages:images titles:titles color:colors action:@selector(rightItemsAction:)];
}

- (void)yi_setNavRightItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors action:(SEL)action {
    NSUInteger count = 0;
    if (images.count > titles.count) {
        count = images.count;
    } else {
        count = titles.count;
    }
    NSMutableArray * items = NSMutableArray.array;
    for (NSInteger i = 0; i < count; i++) {
        UIBarButtonItem *buttonItem;
        if (images != nil) {
            if (titles != nil) {
                buttonItem = [self yi_navItemWithImage:images[i] title:titles[i] color:colors[i] action:action];
            } else {
                buttonItem = [self yi_navItemWithImage:images[i] title:nil color:nil action:action];
            }
        } else {
            buttonItem = [self yi_navItemWithImage:nil title:titles[i] color:colors[i] action:action];
        }
        buttonItem.tag = i;
        [items addObject:buttonItem];
    }
    self.navigationItem.rightBarButtonItems = items;
}
- (void)rightItemsAction:(WYJBarButton *)bar {
    [self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.customView == bar) {
            RightNavItemsBlock block = objc_getAssociatedObject(self, &rightItemsKey);
            block(idx);
        }
    }];
}

#pragma mark -----  返回 -----
- (void)yi_goBack {
    [self yi_goBack:YES];
}

- (void)yi_goBack:(BOOL)animated {
    @try {
        if (self.navigationController.viewControllers.count > 1) {
            [self.navigationController popViewControllerAnimated:animated];
        }
        else if (self.presentingViewController) {
            [self dismissViewControllerAnimated:animated completion:nil];
            [self.view endEditing:YES];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

#pragma mark -----  跳转 -----
- (void)yi_dismissOrPopToRootControlelr {
    [self yi_dismissOrPopToRootController:YES];
}
- (void)yi_dismissOrPopToRootController:(BOOL)animated {
    @try {
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:animated completion:nil];
            [self.view endEditing:YES];
        }
        else if (self.navigationController.viewControllers.count > 1) {
            [self.navigationController popToRootViewControllerAnimated:animated];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
}

- (instancetype)yi_topPresentedVC {
    return [self yi_topPresentedVCWihtKeys:@[@"centerViewController", @"contentViewController"]];
}

- (instancetype)yi_topPresentedVCWihtKeys:(NSArray<NSString *> *)keys {
    UIViewController *rootVC = self;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tab = (UITabBarController *)rootVC;
        UIViewController *vc = tab.selectedViewController ?: tab.childViewControllers.firstObject;
        if (vc) {
            return [vc yi_topPresentedVC];
        }
    }
    for (NSString *key in keys) {
        if ([rootVC respondsToSelector:NSSelectorFromString(key)]) {
            UIViewController *vc;
            @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                vc = [rootVC performSelector:NSSelectorFromString(key)];
#pragma clang diagnostic pop
            } @catch (NSException *exception) {
            }
            if ([vc isKindOfClass:[UIViewController class]]) {
                return [vc yi_topPresentedVC];
            }
        }
    }
    while (rootVC.presentedViewController) {
        rootVC = rootVC.presentedViewController;
    }
    return rootVC;
}

+ (instancetype)yi_rootTopPresentedVC {
    return [[[UIApplication sharedApplication] delegate] window].rootViewController.yi_topPresentedVC;
}

- (NSArray<UIViewController *> *)optimizeVcs:(NSArray<UIViewController *> *)vcs {
    return [self optimizeVcs:vcs maxCount:1];
}

- (NSArray<UIViewController *> *)optimizeVcs:(NSArray<UIViewController *> *)vcs maxCount:(NSUInteger)count {
    NSMutableArray *vcArray = [NSMutableArray arrayWithArray:vcs];
    [vcArray addObject:self];
    for (UIViewController *vc in vcArray.reverseObjectEnumerator) {
        if ([vc isKindOfClass:[self class]]) {
            if (count) {
                count--;
            }
            else {
                [vcArray removeObject:vc];
            }
        }
    }
    return vcArray.copy;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.navigationController.viewControllers.count > 0 ) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [self.navigationController pushViewController:viewController animated:animated];
}

#pragma make ------ 扩展属性 ------
/** 标题颜色 */
- (void)setYi_titleColor:(UIColor *)yi_titleColor {
    objc_setAssociatedObject(self, &titleColorKey, yi_titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)yi_titleColor {
    return objc_getAssociatedObject(self, &titleColorKey);
}

- (void)setYi_navBackgroundColor:(UIColor *)yi_navBackgroundColor {
    objc_setAssociatedObject(self, &NavBackgroundColorKey, yi_navBackgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.navigationController.navigationBar.barTintColor = yi_navBackgroundColor;
    self.navigationController.navigationBar.translucent = NO;
    if (self.yi_hiddenShadow) {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
}

- (UIColor *)yi_navBackgroundColor {
    return objc_getAssociatedObject(self, &NavBackgroundColorKey);
}

- (void)setYi_hiddenShadow:(BOOL)yi_hiddenShadow{
    objc_setAssociatedObject(self, &HidderShadowKey, @(yi_hiddenShadow), OBJC_ASSOCIATION_ASSIGN);
    if (yi_hiddenShadow) {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
}

- (BOOL)yi_hiddenShadow {
    return [objc_getAssociatedObject(self, &HidderShadowKey) boolValue];
}

- (void)setYi_backgroundColor:(UIColor *)yi_backgroundColor {
    objc_setAssociatedObject(self, &BackgroundColorKey, yi_backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.view.backgroundColor = yi_backgroundColor;
}

- (UIColor *)yi_backgroundColor {
    return objc_getAssociatedObject(self, &BackgroundColorKey);
}

- (void)setYi_endEditing:(BOOL)yi_endEditing {
    objc_setAssociatedObject(self, &EndEditKey, @(yi_endEditing), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)yi_endEditing {
    return [objc_getAssociatedObject(self, &EndEditKey) boolValue];
}

- (void)setYi_hiddenNavigationBar:(BOOL)yi_hiddenNavigationBar {
    objc_setAssociatedObject(self, &HiddenNavigationBarKey, @(yi_hiddenNavigationBar), OBJC_ASSOCIATION_ASSIGN);
    [self.navigationController setNavigationBarHidden:yi_hiddenNavigationBar animated:self.animated];
}

- (BOOL)yi_hiddenNavigationBar {
    return [objc_getAssociatedObject(self, &HiddenNavigationBarKey) boolValue];
}

- (BOOL)animated {
    return [objc_getAssociatedObject(self, &AnimatedKey) boolValue];
}

- (void)setAnimated:(BOOL)animated {
    objc_setAssociatedObject(self, &AnimatedKey, @(animated), OBJC_ASSOCIATION_ASSIGN);
}

@end
