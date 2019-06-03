/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import <UIKit/UIKit.h>

@interface YJBaseTableView : UITableView

#pragma make ------ empty ------
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

#pragma make ------ refresh heder------
@property (nonatomic, assign)BOOL hiddenTime;
@property (nonatomic, assign)BOOL hiddenState;


/**
 empty text
 @param msg text
 */
- (void)wShowNoSourcePageWithEmpty:(NSString *)msg;

/**
 empty button
 @param string text
 @param click event
 */
- (void)wShowButtonTitleForEmpty:(NSString *)string Click:(void(^)(void))click;

/**
 header and footer refresh
 */
- (void)wRefreshHeaderWithRefreshingBlock:(void(^)(void))headerBlock footerWithRefreshingBlock:(void(^)(void))footBlock;

/**
 normal refresh
 */
- (void)wRefreshNormakHeaderWithRefreshingBlock:(void(^)(void))headerBlock;

/**
 git refresh (ongoing...)
 */
- (void)wRefreshGifHeaderWithRefreshingBlock:(void(^)(void))headerBlock;


/**
 footer refresh
 */
- (void)wRefreshFooterWithRefreshingBlock:(void(^)(void))footBlock;

/**
 show nor more data
 */
- (void)wEndRefreshingWithNoMoreData;

/**
 end refresh
 */
- (void)wEndRefresh;

/**
 end refresh and no more data
 */
- (void)wEndRefreshAndNoMoreData;

@end
