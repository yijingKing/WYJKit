/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

@interface WYJBaseCollectionView : UICollectionView
@property (nonatomic, copy)NSAttributedString * emptyTitleAttributedString;
@property (nonatomic, copy)NSString * emptyTitle;
@property (nonatomic, strong)UIFont * emptyTitleFont;
@property (nonatomic, strong)UIColor * emptyTitleColor;
@property (nonatomic, strong)UIImage * emptyImage;

@property (nonatomic, copy)NSString * emptyDescription;
@property (nonatomic, strong)UIFont * emptyDescriptionFont;
@property (nonatomic, strong)UIColor * emptyDescriptionColor;
@property (nonatomic, copy)NSAttributedString * emptyDescriptionAttributedString;

@property (nonatomic, strong)UIColor * emptyBackgroundColor;
@property (nonatomic, copy)NSArray * dataSoureBaseArray;
- (WYJBaseCollectionView *)yi;
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
