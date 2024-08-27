/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseTableViewCell : UITableViewCell
@property (nonatomic,strong) UIImageView *nextImageView;
@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,assign) BOOL showNext;
@property (nonatomic,assign) BOOL showLine;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,assign) CGFloat bgSpace;
@property (nonatomic,assign) CGFloat lineSpace;
@property (nonatomic,assign) CGFloat bgHeight;
- (void)initElement;
@property (nonatomic,copy) void (^onReload)(id t);

@end

NS_ASSUME_NONNULL_END
