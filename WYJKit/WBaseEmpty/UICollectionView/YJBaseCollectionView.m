/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "YJBaseCollectionView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <MJRefresh/MJRefresh.h>

static const char yi_emptyTitleKey;
static const char yi_emptyImageKey;
static const char yi_emptyBackgroundColorKey;
static const char yi_emptyDescriptionKey;

typedef enum : NSUInteger {
    EmptyTypeNomer = 0,
    EmptyTypeButton,
} EmptyTypeState;

@interface YJBaseCollectionView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property(nonatomic,assign)EmptyTypeState state;
/** is empty data */
@property (assign, nonatomic) BOOL isEmptyPage;

/** empty str */
@property (strong, nonatomic)NSString *emptyMsg;

/** is firsh show */
@property (assign, nonatomic) BOOL isFirstShow;

/** is title  */
@property(nonatomic,assign) BOOL isEmptyData;
/** is button  */
@property(nonatomic,assign) BOOL isEmptyButton;

/** clickBadNetWorkPage */
@property (strong, nonatomic) void(^clickBadNetWorkPage)(void);
@end

@implementation YJBaseCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        self.emptyMsg = @"暂无数据";
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        self.backgroundColor = UIColor.clearColor;
        self.isFirstShow = YES;
        [self yi_showNoSourcePageWithIsEmptyMsg:self.emptyMsg];
    }
    return self;
}

- (void)yi_refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock footerWithRefreshingBlock:(void(^)(void))footBlock {
    if (headerBlock) {
        if (self.mj_header) {
            self.mj_header = nil;
        }
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            headerBlock();
        }];
    }
    if (footBlock) {
        if (self.mj_footer) {
            self.mj_footer = nil;
        }
        if (self.yi_dataSoureBaseArray.count == 0  && self.yi_dataSoureBaseArray != nil) {
            self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                footBlock();
            }];
        } else {
            self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                footBlock();
            }];
        }
    }
}

- (void)yi_refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock {
    if (headerBlock) {
        if (self.mj_header) {
            self.mj_header = nil;
        }
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            headerBlock();
        }];
    }
}

- (void)yi_refreshFooterWithRefreshingBlock:(void (^)(void))footBlock {
    if (self.mj_footer) {
        self.mj_footer = nil;
    }
    if (footBlock) {
        if (self.yi_dataSoureBaseArray.count == 0 && self.yi_dataSoureBaseArray != nil) {
            self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                footBlock();
            }];
        } else {
            self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                footBlock();
            }];
        }
    }
}


- (void)yi_endRefreshingWithNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)yi_endRefresh {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

- (void)yi_showNoSourcePageWithIsEmptyMsg:(NSString *)msg {
    self.emptyMsg = msg;
    self.state = EmptyTypeNomer;
    [self reloadEmptyDataSet];
    [self yi_endRefresh];
}

- (void)yi_showButtonTitleForEmpty:(NSString *)string Click:(void(^)(void))click {
    self.emptyMsg = string;
    self.clickBadNetWorkPage = click;
    self.state = EmptyTypeButton;
    [self reloadEmptyDataSet];
    [self yi_endRefresh];
}

- (void)yi_endRefreshAndNoMoreData {
    [self yi_endRefresh];
    [self yi_endRefreshingWithNoMoreData];
}

#pragma mark - DZNEmptyDataSetSource
/**
 *  返回标题文字
 */
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    UIFont * font = self.yi_emptyTitleFont ?: [UIFont systemFontOfSize:16];
    
    NSDictionary *attrDic = @{NSFontAttributeName: font,
                              NSForegroundColorAttributeName : self.yi_emptyTitleColor ?: [UIColor lightGrayColor]
                              };
    
    if (self.isFirstShow || self.state == EmptyTypeButton) {
        self.isFirstShow = NO;
        return nil;
    }
    //富文本
    if (self.yi_emptyTitleAttributedString) {
        return self.yi_emptyTitleAttributedString;
    } else
    /* 字符串 */
        if (self.yi_emptyTitle) {
            NSAttributedString *msg = [[NSAttributedString alloc] initWithString:self.yi_emptyTitle attributes:attrDic];
            return msg;
        }
    NSAttributedString *msg = [[NSAttributedString alloc] initWithString:self.emptyMsg attributes:attrDic];
    return msg;
}

/**
 *  文字按钮
 */
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    UIFont * font = self.yi_emptyTitleFont ?: [UIFont systemFontOfSize:16];
    UIColor *textColor = self.yi_emptyDescriptionColor ?: UIColor.lightGrayColor;
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    [attributes setObject:font forKey:NSFontAttributeName];
    [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (self.isFirstShow || self.state == EmptyTypeNomer) {
        self.isFirstShow = NO;
        return nil;
    }
    //富文本
    if (self.yi_emptyTitleAttributedString) {
        return self.yi_emptyTitleAttributedString;
    } else
    /* 字符串 */
        if (self.yi_emptyTitle) {
            NSAttributedString *msg = [[NSAttributedString alloc] initWithString:self.yi_emptyTitle attributes:attributes];
            return msg;
        }
    return [[NSAttributedString alloc] initWithString:self.emptyMsg attributes:attributes];
}

/**
 *  返回占位图图片
 */
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.yi_emptyImage ?: nil;
}

/**
 *  返回详情文字
 */
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    UIFont * font = self.yi_emptyDescriptionFont ?: [UIFont systemFontOfSize:16];
    UIColor *textColor = self.yi_emptyDescriptionColor ?: UIColor.lightGrayColor;
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    [attributes setObject:font forKey:NSFontAttributeName];
    [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    //富文本
    if (self.yi_emptyDescriptionAttributedString) {
        return self.yi_emptyDescriptionAttributedString;
    } else
    /* 字符串 */
        if (self.yi_emptyDescription) {
            NSAttributedString *msg = [[NSAttributedString alloc] initWithString:self.yi_emptyDescription attributes:attributes];
            return msg;
        }
    return nil;
}

/**
 *  返回图片按钮（如果设置了此方法，buttonTitleForEmptyDataSet: ，返回文字按钮方法就会失效
 */
//- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
//    return [UIImage imageNamed:@""];
//}

/**
 *  自定义背景颜色
 */
- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.yi_emptyBackgroundColor ?: UIColor.whiteColor;
}

/**
 *  自定义视图 （关键方法，可以做一些自定义占位视图）
 */
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    return nil;
}

/**
 *  数据源为空时是否渲染和显示 (默认为 YES)
 */
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return YES;
}

/**
 *  是否允许点击 (默认为 YES)
 */
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return YES;
}

/**
 *  是否允许滚动 (默认为 NO)
 */
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView {
    return NO;
}

/**
 *  是否允许动画 (默认为 NO)
 */
- (BOOL)emptyDataSetShouldAllowImageViewAnimate:(UIScrollView *)scrollView {
    return YES;
}

#pragma mark - DZNEmptyDataSetDelegate
/**
 *  视图点击触发
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view {
    if (self.state == EmptyTypeButton) {
        [self clickBadNetPage];
    }
}

/**
 *  按钮点击触发
 */
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    if (self.state == EmptyTypeButton) {
        [self clickBadNetPage];
    }
}

- (void)clickBadNetPage {
    if (self.clickBadNetWorkPage) {
        self.clickBadNetWorkPage();
    }
}

- (void)setYi_emptyTitleAttributedString:(NSAttributedString *)yi_yi_emptyTitleAttributedString {
    objc_setAssociatedObject(self, &@selector(yi_emptyTitleAttributedString), yi_yi_emptyTitleAttributedString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (NSString *)yi_emptyTitleAttributedString {
    return objc_getAssociatedObject(self, &@selector(yi_emptyTitleAttributedString));
}

- (void)setYi_emptyTitle:(NSString *)yi_emptyTitle {
    objc_setAssociatedObject(self, &yi_emptyTitleKey, yi_emptyTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (NSString *)yi_emptyTitle {
    return objc_getAssociatedObject(self, &yi_emptyTitleKey);
}

- (void)setYi_emptyTitleFont:(UIFont *)yi_emptyTitleFont {
    objc_setAssociatedObject(self, &@selector(yi_emptyTitleFont), yi_emptyTitleFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIFont *)yi_emptyTitleFont {
    return objc_getAssociatedObject(self, &@selector(yi_emptyTitleFont));
}

- (void)setYi_emptyTitleColor:(UIColor *)yi_emptyTitleColor {
    objc_setAssociatedObject(self, &@selector(yi_emptyTitleColor), yi_emptyTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIColor *)yi_emptyTitleColor {
    return objc_getAssociatedObject(self, &@selector(yi_emptyTitleColor));
}

- (void)setYi_emptyImage:(UIImage *)yi_emptyImage {
    objc_setAssociatedObject(self, &yi_emptyImageKey, yi_emptyImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIImage *)yi_emptyImage {
    return objc_getAssociatedObject(self, &yi_emptyImageKey);
}

- (void)setYi_emptyBackgroundColor:(UIColor *)yi_emptyBackgroundColor {
    objc_setAssociatedObject(self, &yi_emptyBackgroundColorKey, yi_emptyBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIColor *)yi_emptyBackgroundColor {
    return objc_getAssociatedObject(self, &yi_emptyBackgroundColorKey);
}

- (void)setYi_emptyDescription:(NSString *)yi_emptyDescription {
    objc_setAssociatedObject(self, &yi_emptyDescriptionKey, yi_emptyDescription, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (NSString *)yi_emptyDescription {
    return objc_getAssociatedObject(self, &yi_emptyDescriptionKey);
}

- (void)setYi_emptyDescriptionFont:(UIFont *)yi_emptyDescriptionFont {
    objc_setAssociatedObject(self, &@selector(yi_emptyDescriptionFont), yi_emptyDescriptionFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)yi_emptyDescriptionFont {
    return objc_getAssociatedObject(self, &@selector(yi_emptyDescriptionFont));
}

- (void)setYi_emptyDescriptionColor:(UIColor *)yi_emptyDescriptionColor {
    objc_setAssociatedObject(self, &@selector(yi_emptyDescriptionColor), yi_emptyDescriptionColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIFont *)yi_emptyDescriptionColor {
    return objc_getAssociatedObject(self, &@selector(yi_emptyDescriptionColor));
}

- (void)setYi_emptyDescriptionAttributedString:(NSAttributedString *)yi_emptyDescriptionAttributedString {
    objc_setAssociatedObject(self, &yi_emptyDescriptionAttributedString, yi_emptyDescriptionAttributedString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (NSString *)yi_emptyDescriptionAttributedString {
    return objc_getAssociatedObject(self, &@selector(yi_emptyDescriptionAttributedString));
}

@end
