/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/


#import "WYJBaseTableView.h"
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
#import <MJRefresh/MJRefresh.h>
#import "WYJKitHeader.h"
static const char emptyTitleKey;
static const char emptyImageKey;
static const char emptyBackgroundColorKey;
static const char emptyDescriptionKey;

typedef enum : NSUInteger {
    EmptyTypeNomer = 0,
    EmptyTypeButton,
} EmptyTypeState;

@interface WYJBaseTableView ()<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>


@property(nonatomic,assign) EmptyTypeState state;
/** is empty data */
@property (assign, nonatomic) BOOL isEmptyPage;

/** empty str */
@property (strong, nonatomic) NSString *emptyMsg;

/** is firsh show */
@property (assign, nonatomic) BOOL isFirstShow;

/** 显示的字  */
@property(nonatomic,assign) BOOL isEmptyData;
/** is button  */
@property(nonatomic,assign) BOOL isEmptyButton;
/** clickBadNetWorkPage */
@property (strong, nonatomic) void(^clickBadNetWorkPage)(void);
@end

@implementation WYJBaseTableView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initNormal];
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self initNormal];
    }
    return self;
}

- (void)initNormal {
    if (@available(iOS 11.0, *)) {
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
//            self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.isFirstShow = YES;
    self.backgroundColor = UIColor.clearColor;
    
    #ifdef __IPHONE_15_0
    if (@available(iOS 15.0, *)) {
        self.sectionHeaderTopPadding = 0;
    }
    #endif
    self.emptyMsg = @"暂无数据";
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YJSCREEN_WIDTH, YJBottomHeight)];
    self.tableFooterView = footerView;
}

- (void)setIsUserEmpty:(BOOL)isUserEmpty {
    _isUserEmpty = isUserEmpty;
    if (_isUserEmpty) {
        self.emptyDataSetSource = self;
        self.emptyDataSetDelegate = self;
        [self showNoSourcePageWithEmpty:self.emptyMsg];
    } else {
        self.emptyDataSetSource = nil;
        self.emptyDataSetDelegate = nil;
        [self showNoSourcePageWithEmpty:self.emptyMsg];
    }
}

- (void)refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock footerWithRefreshingBlock:(void(^)(void))footBlock {
    if (headerBlock) {
        MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            headerBlock();
        }];
        self.mj_header = header;
    }
    if (footBlock) {
        MJRefreshBackNormalFooter * footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            footBlock();
        }];
        self.mj_footer = footer;
    }
}

- (void)refreshNormakHeaderWithRefreshingBlock:(void(^)(void))headerBlock {
    if (headerBlock) {
        MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            headerBlock();
        }];
        self.mj_header = header;
    }
}

- (void)refreshGifHeaderWithRefreshingBlock:(void(^)(void))headerBlock {
    if (headerBlock) {
        MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
            headerBlock();
        }];
        self.mj_header = header;
    }
}


- (void)refreshFooterWithRefreshingBlock:(void (^)(void))footBlock {
    if (footBlock) {
        MJRefreshBackNormalFooter * footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            footBlock();
        }];
        self.mj_footer = footer;
    }
}


- (void)endRefreshingWithNoMoreData {
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)endRefresh {
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

- (void)showNoSourcePageWithEmpty:(NSString *)msg {
    self.emptyMsg = msg;
    self.state = EmptyTypeNomer;
    [self reloadEmptyDataSet];
    [self endRefresh];
}

- (void)showButtonTitleForEmpty:(NSString *)string Click:(void(^)(void))click {
    self.emptyMsg = string;
    self.clickBadNetWorkPage = click;
    self.state = EmptyTypeButton;
    [self reloadEmptyDataSet];
    [self endRefresh];
}

- (void)endRefreshAndNoMoreData {
    [self endRefresh];
    [self endRefreshingWithNoMoreData];
}

#pragma mark - DZNEmptyDataSetSource
/**
 *  返回标题文字
 */
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    UIFont * font = self.emptyTitleFont ?: [UIFont systemFontOfSize:16];
    
    NSDictionary *attrDic = @{NSFontAttributeName: font,
                              NSForegroundColorAttributeName : self.emptyTitleColor ?: [UIColor lightGrayColor]
                              };
    
    if (self.isFirstShow || self.state == EmptyTypeButton) {
        self.isFirstShow = NO;
        return nil;
    }
    //富文本
    if (self.emptyTitleAttributedString) {
        return self.emptyTitleAttributedString;
    } else
    /* 字符串 */
        if (self.emptyTitle) {
        NSAttributedString *msg = [[NSAttributedString alloc] initWithString:self.emptyTitle attributes:attrDic];
        return msg;
    }
    NSAttributedString *msg = [[NSAttributedString alloc] initWithString:self.emptyMsg attributes:attrDic];
    return msg;
}

/**
 *  文字按钮
 */
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    UIFont * font = self.emptyTitleFont ?: [UIFont systemFontOfSize:16];
    UIColor *textColor = self.emptyDescriptionColor ?: UIColor.lightGrayColor;
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    [attributes setObject:font forKey:NSFontAttributeName];
    [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    if (self.isFirstShow || self.state == EmptyTypeNomer) {
        self.isFirstShow = NO;
        return nil;
    }
    //富文本
    if (self.emptyTitleAttributedString) {
        return self.emptyTitleAttributedString;
    } else
    /* 字符串 */
        if (self.emptyTitle) {
            NSAttributedString *msg = [[NSAttributedString alloc] initWithString:self.emptyTitle attributes:attributes];
            return msg;
        }
    return [[NSAttributedString alloc] initWithString:self.emptyMsg attributes:attributes];
}

/**
 *  返回占位图图片
 */
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.emptyImage ?: nil;
}

/**
 *  返回详情文字
 */
- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    UIFont * font = self.emptyDescriptionFont ?: [UIFont systemFontOfSize:16];
    UIColor *textColor = self.emptyDescriptionColor ?: UIColor.lightGrayColor;
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    [attributes setObject:font forKey:NSFontAttributeName];
    [attributes setObject:textColor forKey:NSForegroundColorAttributeName];
    //富文本
    if (self.emptyDescriptionAttributedString) {
        return self.emptyDescriptionAttributedString;
    } else
    /* 字符串 */
        if (self.emptyDescription) {
            NSAttributedString *msg = [[NSAttributedString alloc] initWithString:self.emptyDescription attributes:attributes];
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
    return self.emptyBackgroundColor ?: UIColor.whiteColor;
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

#pragma make ------ static ------
void CustomHeader (WYJBaseTableView * tab) {
    if (tab.mj_header) {
        MJRefreshStateHeader * header = (MJRefreshStateHeader *)tab.mj_header;
        header.lastUpdatedTimeLabel.hidden = tab.hiddenTime;
        header.stateLabel.hidden = tab.hiddenState;
    }
}

#pragma make ------ runtime  ------

- (void)setEmptyTitleAttributedString:(NSAttributedString *)emptyTitleAttributedString {
    objc_setAssociatedObject(self, &@selector(emptyTitleAttributedString), emptyTitleAttributedString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (NSString *)emptyTitleAttributedString {
    return objc_getAssociatedObject(self, &@selector(emptyTitleAttributedString));
}
- (void)setEmptyTitle:(NSString *)emptyTitle {
    objc_setAssociatedObject(self, &emptyTitleKey, emptyTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (NSString *)emptyTitle {
    return objc_getAssociatedObject(self, &emptyTitleKey);
}

- (void)setEmptyTitleFont:(UIFont *)emptyTitleFont {
    objc_setAssociatedObject(self, &@selector(emptyTitleFont), emptyTitleFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIFont *)emptyTitleFont {
    return objc_getAssociatedObject(self, &@selector(emptyTitleFont));
}

- (void)setEmptyTitleColor:(UIColor *)emptyTitleColor {
    objc_setAssociatedObject(self, &@selector(emptyTitleColor), emptyTitleColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIColor *)emptyTitleColor {
    return objc_getAssociatedObject(self, &@selector(emptyTitleColor));
}

- (void)setEmptyImage:(UIImage *)emptyImage {
    objc_setAssociatedObject(self, &emptyImageKey, emptyImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIImage *)emptyImage {
    return objc_getAssociatedObject(self, &emptyImageKey);
}

- (void)setEmptyBackgroundColor:(UIColor *)emptyBackgroundColor {
    objc_setAssociatedObject(self, &emptyBackgroundColorKey, emptyBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIColor *)emptyBackgroundColor {
    return objc_getAssociatedObject(self, &emptyBackgroundColorKey);
}

- (void)setEmptyDescription:(NSString *)emptyDescription {
    objc_setAssociatedObject(self, &emptyDescriptionKey, emptyDescription, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (NSString *)emptyDescription {
    return objc_getAssociatedObject(self, &emptyDescriptionKey);
}

- (void)setEmptyDescriptionFont:(UIFont *)emptyDescriptionFont {
    objc_setAssociatedObject(self, &@selector(emptyDescriptionFont), emptyDescriptionFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIFont *)emptyDescriptionFont {
    return objc_getAssociatedObject(self, &@selector(emptyDescriptionFont));
}

- (void)setEmptyDescriptionColor:(UIColor *)emptyDescriptionColor {
    objc_setAssociatedObject(self, &@selector(emptyDescriptionColor), emptyDescriptionColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (UIFont *)emptyDescriptionColor {
    return objc_getAssociatedObject(self, &@selector(emptyDescriptionColor));
}

- (void)setEmptyDescriptionAttributedString:(NSAttributedString *)emptyDescriptionAttributedString {
    objc_setAssociatedObject(self, &emptyDescriptionAttributedString, emptyDescriptionAttributedString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self reloadEmptyDataSet];
}

- (NSString *)emptyDescriptionAttributedString {
    return objc_getAssociatedObject(self, &@selector(emptyDescriptionAttributedString));
}

- (void)setHiddenTime:(BOOL)hiddenTime {
    objc_setAssociatedObject(self, &@selector(hiddenTime), @(hiddenTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    CustomHeader(self);
    
}

- (BOOL)hiddenTime {
    return [objc_getAssociatedObject(self, &@selector(hiddenTime)) boolValue];
}

- (void)setHiddenState:(BOOL)hiddenState {
    objc_setAssociatedObject(self, &@selector(hiddenState), @(hiddenState), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    CustomHeader(self);
}



- (BOOL)hiddenState {
    return [objc_getAssociatedObject(self, &@selector(hiddenState)) boolValue];
}
@end
