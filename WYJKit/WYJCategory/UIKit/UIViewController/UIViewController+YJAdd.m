/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "UIViewController+YJAdd.h"
#import "WYJNavigationButton.h"
#import <objc/runtime.h>
#import "UIImageCategoryHeader.h"
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
- (void)setBackItem:(UIImage *)image {
    [self setBackItem:image closeItem:image];
}

- (void)showNavTitle:(NSString *)title backItem:(BOOL)show {
    [self setNavTitle:title];
    if (show) {
        [self setBackItem:[UIImage imageNamed:@"nav_back"] closeItem:[UIImage imageNamed:@"nav_close"]];
    }
    else {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = YES;
    }
}

- (void)setBackItem:(UIImage *)image closeItem:(UIImage *)closeImage {
    if (self.navigationController.viewControllers.count == 1 && self.presentingViewController) {
        self.navigationItem.leftBarButtonItem = [self navItemWithImage:closeImage
                                                                 title:(closeImage ? nil : @"ㄨ")
                                                                action:@selector(goBack)];
    }
    else if ((self.navigationController.viewControllers.count > 1 || (!self.navigationController && !self.parentViewController))) {
        UIBarButtonItem *backItem = [self navItemWithImage:image
                                                     title:(image ? nil : @"ㄑ")
                                                    action:@selector(goBack)];
        self.navigationItem.leftBarButtonItems = @[backItem];
    }
    else {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = YES;
    }
    ((UIButton *)self.navigationItem.leftBarButtonItem.customView).contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
}

#pragma make ------ 导航标题 ------
- (void)setNavTitle:(NSString *)title {
    [self setNavTitle:title color: self.titleColor ?: UIColor.blackColor];
}

- (void)setNavTitle:(NSString *)title color:(UIColor *)color {
    [self setNavTitle:title color:color font:[UIFont systemFontOfSize:17]];
}
- (void)setNavTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    self.navigationItem.title = title;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : color}];
    [self color:color font:font backgroundColor:UIColor.whiteColor];
}
- (void)color:(UIColor *)color font:(UIFont *)font backgroundColor:(UIColor *_Nullable)backgroundColor {
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        [appearance configureWithTransparentBackground];
        self.navigationController.navigationBar.translucent = NO;
        if (backgroundColor == UIColor.clearColor) {
            self.navigationController.navigationBar.translucent = YES;
            appearance.backgroundImage = [UIImage imageWithColor:UIColor.clearColor];
        } else {
            appearance.backgroundColor = backgroundColor;
        }
        appearance.shadowImage = [UIImage imageWithColor:UIColor.clearColor];
        appearance.shadowColor = UIColor.clearColor;
        appearance.titleTextAttributes = @{NSForegroundColorAttributeName: color,NSFontAttributeName:font};
        [self addNavigationBarAppearance:appearance];
    } else {
        self.navigationController.navigationBar.translucent = NO;
        if (backgroundColor == UIColor.clearColor) {
            self.navigationController.navigationBar.translucent = YES;
            [self.navigationController.navigationBar setBackgroundImage:UIImage.alloc.init forBarMetrics:(UIBarMetricsDefault)];
        } else {
            [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:(UIBarMetricsDefault)];
            self.navigationController.navigationBar.barTintColor = backgroundColor;
        }
        self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName: color}];
    }
}
- (void)addNavigationBarAppearance:(UINavigationBarAppearance *)appearance  API_AVAILABLE(ios(13.0)){
    ///带scroll滑动的页面
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    /// 常规页面
    self.navigationController.navigationBar.standardAppearance = appearance;
}


- (void)setNavTitleView:(UIView *)titleView {
    self.navigationItem.titleView = titleView;
}

#pragma mark -----  导航按钮 -----
- (UIBarButtonItem *)navItemWithImage:(UIImage *)image action:(SEL)action {
    return [self navItemWithImage:image title:nil color:nil action:action];
}

- (UIBarButtonItem *)navItemWithTitle:(NSString *)title action:(SEL)action {
    return [self navItemWithImage:nil title:title color:nil action:action];
}

- (UIBarButtonItem *)navItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action {
    return [self navItemWithImage:nil title:title color:color action:action];
}

- (UIBarButtonItem *)navItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action {
    return [self navItemWithImage:image title:title color:nil action:action];
}

- (UIBarButtonItem *)navItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color action:(SEL)action {
    return [self navItemWithImage:image title:title color:color target:self action:action];
}
- (UIBarButtonItem *)navItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color target:(id)target action:(SEL)action {
    WYJBarButton *button = [WYJBarButton buttonWithImage:image title:title color:color target:self action:action];
    button.frame = CGRectMake(10, 0, 44, 44);
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma mark -----  导航 左按钮 -----
- (void)setNavLeftItemWithImage:(UIImage *)image action:(SEL)action {
    [self setNavLeftItemWithImage:image title:nil color:UIColor.blackColor action:action];
}

- (void)setNavLeftItemWithTitle:(NSString *)title action:(SEL)action {
    [self setNavLeftItemWithImage:nil title:title color:UIColor.blackColor action:action];
}

- (void)setNavLeftItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action {
    [self setNavLeftItemWithImage:nil title:title color:color action:action];
}

- (void)setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action {
    [self setNavLeftItemWithImage:image title:title color:UIColor.blackColor action:action];
}

- (void)setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color action:(SEL)action {
    WYJBarButton *button = [WYJBarButton buttonWithImage:image title:title color:color target:self action:action];
    button.frame = CGRectMake(10, 0, 44, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}
#pragma mark -----  导航 左按钮 多个 -----

- (void)setNavLeftItemsWithImages:(NSArray<UIImage *> *)images action:(SEL)action {
    [self setNavLeftItemsWithImages:images titles:nil color:nil action:action];
}

- (void)setNavLeftItemsWithTitles:(NSArray<NSString *> *)titles action:(SEL)action {
    [self setNavLeftItemsWithImages:nil titles:titles color:nil action:action];
}

- (void)setNavLeftItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors action:(SEL)action {
    [self setNavLeftItemsWithImages:nil titles:titles color:colors action:action];
}

- (void)setNavLeftItemsWithImages:(NSArray<UIImage *> *)images actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &leftItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemsWithImages:images titles:nil color:nil action:@selector(leftItemsAction:)];
}

- (void)setNavLeftItemsWithTitles:(NSArray<NSString *> *)titles actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &leftItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemsWithImages:nil titles:titles color:nil action:@selector(leftItemsAction:)];
}

- (void)setNavLeftItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &leftItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemsWithImages:nil titles:titles color:colors action:@selector(leftItemsAction:)];
}

- (void)setNavLeftItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &leftItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemsWithImages:images titles:titles color:colors action:@selector(leftItemsAction:)];
}

- (void)setNavLeftItemsWithImages:(nullable NSArray <UIImage *> *)images titles:(nullable NSArray *)titles color:(NSArray *)colors action:(SEL)action {
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
                buttonItem = [self navItemWithImage:images[i] title:titles[i] color:colors[i] action:action];
            } else {
                buttonItem = [self navItemWithImage:images[i] title:nil color:nil action:action];
            }
        } else {
            buttonItem = [self navItemWithImage:nil title:titles[i] color:colors[i] action:action];
        }
        buttonItem.tag = i;
        [items addObject:buttonItem];
    }
    self.navigationItem.leftBarButtonItems = items;
}
- (void)leftItemsAction:(WYJBarButton *)bar {
    [self.navigationItem.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * obj, NSUInteger idx, BOOL * stop) {
        if (obj.customView == bar) {
            LeftNavItemsBlock block = objc_getAssociatedObject(self, &leftItemsKey);
            block(idx);
        }
    }];
}


#pragma mark -----  导航 右按钮 -----
- (void)setNavRightItemWithImage:(UIImage *)image action:(SEL)action {
    [self setNavRightItemWithImage:image title:nil color:nil action:action];
}

- (void)setNavRightItemWithTitle:(NSString *)title action:(SEL)action {
    [self setNavRightItemWithImage:nil title:title color:nil action:action];
}

- (void)setNavRightItemWithTitle:(NSString *)title color:(UIColor *)color action:(SEL)action {
    [self setNavRightItemWithImage:nil title:title color:color action:action];
}

- (void)setNavRightItemWithImage:(UIImage *)image title:(NSString *)title action:(SEL)action {
    [self setNavRightItemWithImage:image title:title color:nil action:action];
}

- (void)setNavRightItemWithImage:(nullable UIImage *)image title:(nullable NSString *)title color:(nullable UIColor *)color action:(SEL)action {
    WYJBarButton *button = [WYJBarButton buttonWithImage:image title:title color:color target:self action:action];
    button.frame = CGRectMake(10, 0, 44, 44);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

/** 导航 左按钮 文 */
- (void)setNavLeftItemWithTitle:(NSString *)title actionBlock:(void(^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemWithTitle:title action:@selector(navBlockAction)];
}

- (void)setNavLeftItemWithTitle:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemWithTitle:title color:color action:@selector(navBlockAction)];
}

- (void)setNavLeftItemWithImage:(UIImage *)image actionBlock:(void(^)(void))block; {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemWithImage:image action:@selector(navBlockAction)];
}

- (void)setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemWithImage:image title:title action:@selector(navBlockAction)];
}

- (void)setNavLeftItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color actionBlock:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavLeftItemWithImage:image title:title color:color action:@selector(navBlockAction)];
}

/** 导航 右按钮 文 */
- (void)setNavRightItemWithTitle:(NSString *)title actionBlock:(void(^)(void))block{
    if (block) {
        objc_setAssociatedObject(self, &ritemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemWithTitle:title action:@selector(rightNavBlockAction)];
}

- (void)setNavRightItemWithTitle:(NSString *)title color:(UIColor *)color actionBlock:(void(^)(void))block{
    if (block) {
        objc_setAssociatedObject(self, &ritemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemWithTitle:title color:color action:@selector(rightNavBlockAction)];
}

/** 导航 右按钮 图 */
- (void)setNavRightItemWithImage:(UIImage *)image actionBlock:(void(^)(void))block{
    if (block) {
        objc_setAssociatedObject(self, &ritemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemWithImage:image action:@selector(rightNavBlockAction)];
}

- (void)setNavRightItemWithImage:(UIImage *)image title:(NSString *)title actionBlock:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemWithImage:image title:title action:@selector(rightNavBlockAction)];
}

- (void)setNavRightItemWithImage:(UIImage *)image title:(NSString *)title color:(UIColor *)color actionBlock:(void (^)(void))block {
    if (block) {
        objc_setAssociatedObject(self, &itemKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemWithImage:image title:title color:color action:@selector(rightNavBlockAction)];
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

- (void)setNavRightItemsWithImages:(NSArray<UIImage *> *)images action:(SEL)action {
    [self setNavRightItemsWithImages:images titles:nil color:nil action:action];
}

- (void)setNavRightItemsWithTitles:(NSArray<NSString *> *)titles action:(SEL)action {
    [self setNavRightItemsWithImages:nil titles:titles color:nil action:action];
}

- (void)setNavRightItemsWithTitles:(NSArray <NSString *> *)titles colors:(NSArray<UIColor *> *)colors action:(SEL)action {
    [self setNavRightItemsWithImages:nil titles:titles color:colors action:action];
}

- (void)setNavRightItemsWithImages:(NSArray<UIImage *> *)images actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &rightItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemsWithImages:images titles:nil color:nil action:@selector(rightItemsAction:)];
}

- (void)setNavRightItemsWithTitles:(NSArray<NSString *> *)titles actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &rightItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemsWithImages:nil titles:titles color:nil action:@selector(rightItemsAction:)];
}

- (void)setNavRightItemsWithTitles:(NSArray<NSString *> *)titles colors:(NSArray<UIColor *> *)colors actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &rightItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemsWithImages:nil titles:titles color:colors action:@selector(rightItemsAction:)];
}
- (void)setNavRightItemsWithImages:(NSArray <UIImage *> *)images titles:(NSArray *)titles color:(NSArray *)colors actionBlock:(void(^)(NSInteger tag))block {
    if (block) {
        objc_setAssociatedObject(self, &rightItemsKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self setNavRightItemsWithImages:images titles:titles color:colors action:@selector(rightItemsAction:)];
}

- (void)setNavRightItemsWithImages:(nullable NSArray <UIImage *> *)images titles:(nullable NSArray *)titles color:(nullable NSArray *)colors action:(SEL)action {
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
                buttonItem = [self navItemWithImage:images[i] title:titles[i] color:colors[i] action:action];
            } else {
                buttonItem = [self navItemWithImage:images[i] title:nil color:nil action:action];
            }
        } else {
            buttonItem = [self navItemWithImage:nil title:titles[i] color:colors[i] action:action];
        }
        buttonItem.tag = i;
        [items addObject:buttonItem];
    }
    self.navigationItem.rightBarButtonItems = items;
}
- (void)rightItemsAction:(WYJBarButton *)bar {
    [self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem * obj, NSUInteger idx, BOOL * stop) {
        if (obj.customView == bar) {
            RightNavItemsBlock block = objc_getAssociatedObject(self, &rightItemsKey);
            block(idx);
        }
    }];
}

#pragma mark -----  返回 -----
- (void)goBack {
    [self goBack:YES];
}

- (void)goBack:(BOOL)animated {
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
- (void)dismissOrPopToRootControlelr {
    [self dismissOrPopToRootController:YES];
}
- (void)dismissOrPopToRootController:(BOOL)animated {
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

- (instancetype)topPresentedVC {
    return [self topPresentedVCWihtKeys:@[@"centerViewController", @"contentViewController"]];
}

- (instancetype)topPresentedVCWihtKeys:(NSArray<NSString *> *)keys {
    UIViewController *rootVC = self;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tab = (UITabBarController *)rootVC;
        UIViewController *vc = tab.selectedViewController ?: tab.childViewControllers.firstObject;
        if (vc) {
            return [vc topPresentedVC];
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
                return [vc topPresentedVC];
            }
        }
    }
    while (rootVC.presentedViewController) {
        rootVC = rootVC.presentedViewController;
    }
    return rootVC;
}

+ (instancetype)rootTopPresentedVC {
    return [[[UIApplication sharedApplication] delegate] window].rootViewController.topPresentedVC;
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
- (void)setTitleColor:(UIColor *)titleColor {
    objc_setAssociatedObject(self, &titleColorKey, titleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)titleColor {
    return objc_getAssociatedObject(self, &titleColorKey);
}

- (void)setNavBackgroundColor:(UIColor *)navBackgroundColor {
    objc_setAssociatedObject(self, &NavBackgroundColorKey, navBackgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.navigationController.navigationBar.barTintColor = navBackgroundColor;
    self.navigationController.navigationBar.translucent = NO;
    if (self.hiddenShadow) {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
}

- (UIColor *)navBackgroundColor {
    return objc_getAssociatedObject(self, &NavBackgroundColorKey);
}

- (void)setHiddenShadow:(BOOL)hiddenShadow{
    objc_setAssociatedObject(self, &HidderShadowKey, @(hiddenShadow), OBJC_ASSOCIATION_ASSIGN);
    if (hiddenShadow) {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
}

- (BOOL)hiddenShadow {
    return [objc_getAssociatedObject(self, &HidderShadowKey) boolValue];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    objc_setAssociatedObject(self, &BackgroundColorKey, backgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.view.backgroundColor = backgroundColor;
}

- (UIColor *)backgroundColor {
    return objc_getAssociatedObject(self, &BackgroundColorKey);
}

- (void)setEndEditing:(BOOL)endEditing {
    objc_setAssociatedObject(self, &EndEditKey, @(endEditing), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)endEditing {
    return [objc_getAssociatedObject(self, &EndEditKey) boolValue];
}

- (void)setHiddenNavigationBar:(BOOL)hiddenNavigationBar {
    objc_setAssociatedObject(self, &HiddenNavigationBarKey, @(hiddenNavigationBar), OBJC_ASSOCIATION_ASSIGN);
    [self.navigationController setNavigationBarHidden:hiddenNavigationBar animated:self.animated];
}

- (BOOL)hiddenNavigationBar {
    return [objc_getAssociatedObject(self, &HiddenNavigationBarKey) boolValue];
}

- (BOOL)animated {
    return [objc_getAssociatedObject(self, &AnimatedKey) boolValue];
}

- (void)setAnimated:(BOOL)animated {
    objc_setAssociatedObject(self, &AnimatedKey, @(animated), OBJC_ASSOCIATION_ASSIGN);
}

@end
