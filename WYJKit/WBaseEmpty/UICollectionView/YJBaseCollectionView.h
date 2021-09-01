/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

@interface YJBaseCollectionView : UICollectionView
@property (nonatomic, copy)NSAttributedString * yi_emptyTitleAttributedString;
@property (nonatomic, copy)NSString * yi_emptyTitle;
@property (nonatomic, strong)UIFont * yi_emptyTitleFont;
@property (nonatomic, strong)UIColor * yi_emptyTitleColor;
@property (nonatomic, strong)UIImage * yi_emptyImage;

@property (nonatomic, copy)NSString * yi_emptyDescription;
@property (nonatomic, strong)UIFont * yi_emptyDescriptionFont;
@property (nonatomic, strong)UIColor * yi_emptyDescriptionColor;
@property (nonatomic, copy)NSAttributedString * yi_emptyDescriptionAttributedString;

@property (nonatomic, strong)UIColor * yi_emptyBackgroundColor;
@property (nonatomic, copy)NSArray * yi_dataSoureBaseArray;

/**
 空页面的字显示
 @param msg 显示的字
 */
- (void)yi_showNoSourcePageWithIsEmptyMsg:(NSString *)msg;

/**
 空页面按钮
 @param string 按钮上的字
 @param click 点击回调
 */
- (void)yi_showButtonTitleForEmpty:(NSString *)string Click:(void(^)(void))click;

/**
 刷新
 @param headerBlock 下拉刷新回调
 @param footBlock 上拉刷新回调
 */
- (void)yi_refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock footerWithRefreshingBlock:(void(^)(void))footBlock;

/**
 刷新
 @param headerBlock 下拉刷新回调
 */
- (void)yi_refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock;

/**
 刷新
 @param footBlock 上拉刷新回调
 */
- (void)yi_refreshFooterWithRefreshingBlock:(void(^)(void))footBlock;

/**
 显示没有更多
 */
- (void)yi_endRefreshingWithNoMoreData;

/**
 结束刷新
 */
- (void)yi_endRefresh;

/** 结束刷新并显示没有更多 */
- (void)yi_endRefreshAndNoMoreData;

@end
