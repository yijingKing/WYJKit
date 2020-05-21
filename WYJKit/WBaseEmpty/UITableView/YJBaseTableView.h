/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

@interface YJBaseTableView : UITableView

#pragma make ------ empty ------
@property (nonatomic, copy)NSAttributedString * yi_yi_emptyTitleAttributedString;
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

#pragma make ------ refresh heder------
@property (nonatomic, assign)BOOL yi_hiddenTime;
@property (nonatomic, assign)BOOL yi_hiddenState;


/**
 empty text
 @param msg text
 */
- (void)yi_showNoSourcePageWithEmpty:(NSString *)msg;

/**
 empty button
 @param string text
 @param click event
 */
- (void)yi_showButtonTitleForEmpty:(NSString *)string Click:(void(^)(void))click;

/**
 header and footer refresh
 */
- (void)yi_refreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock footerWithRefreshingBlock:(void(^)(void))footBlock;

/**
 normal refresh
 */
- (void)wRefreshNormakHeaderWithRefreshingBlock:(void(^)(void))headerBlock;

/**
 git refresh (ongoing...)
 */
- (void)yi_refreshGifHeaderWithRefreshingBlock:(void(^)(void))headerBlock;


/**
 footer refresh
 */
- (void)yi_refreshFooterWithRefreshingBlock:(void(^)(void))footBlock;

/**
 show nor more data
 */
- (void)yi_endRefreshingWithNoMoreData;

/**
 end refresh
 */
- (void)yi_endRefresh;

/**
 end refresh and no more data
 */
- (void)yi_endRefreshAndNoMoreData;

@end
