/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>
#import "WYJBaseCollectionViewDelegate.h"
@interface WYJBaseCollectionView : UICollectionView
@property (strong, nonatomic)WYJBaseCollectionViewDelegate * baseDelegate;
@property (nonatomic,copy) NSArray *dataSoureBaseArray;
#pragma make ------ empty ------
/// 空页面文本
@property (nonatomic, copy)NSString * emptyTitle;
/// 空页面文本字体
@property (nonatomic, strong)UIFont * emptyTitleFont;
/// 空页面文本颜色
@property (nonatomic, strong)UIColor * emptyTitleColor;
/// 空页面富文本
@property (nonatomic, copy)NSAttributedString * emptyTitleAttributedString;
/// 空页面图片
@property (nonatomic, strong)UIImage * emptyImage;
/// 空页面描述
@property (nonatomic, copy)NSString * emptyDescription;
/// 空页面描述字体
@property (nonatomic, strong)UIFont * emptyDescriptionFont;
/// 空页面描述文本颜色
@property (nonatomic, strong)UIColor * emptyDescriptionColor;
/// 空页面描述富文本
@property (nonatomic, copy)NSAttributedString * emptyDescriptionAttributedString;
/// 空页面背景色
@property (nonatomic, strong)UIColor * emptyBackgroundColor;

/**
 空页面的字显示
 @param msg 显示的字
 */
- (void)showNoSourcePageWithIsEmptyMsg:(NSString *)msg;

/**
 空页面按钮
 @param string 按钮上的字
 @param click 点击回调
 */
- (void)showButtonTitleForEmpty:(NSString *)string Click:(void(^)(void))click;

/**
 刷新
 @param headerBlock 下拉刷新回调
 @param footBlock 上拉刷新回调
 */
- (void)refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock footerWithRefreshingBlock:(void(^)(void))footBlock;

/**
 刷新
 @param headerBlock 下拉刷新回调
 */
- (void)refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock;

/**
 刷新
 @param footBlock 上拉刷新回调
 */
- (void)refreshFooterWithRefreshingBlock:(void(^)(void))footBlock;

/**
 显示没有更多
 */
- (void)endRefreshingWithNoMoreData;

/**
 结束刷新
 */
- (void)endRefresh;

/** 结束刷新并显示没有更多 */
- (void)endRefreshAndNoMoreData;

@end
