/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol WYJBaseTableViewCellDelegate <NSObject>

- (void)baseCell:(UITableViewCell *)cell didTriggerEventWithId:(NSInteger)eventId;

@end

@interface WYJBaseTableViewCell : UITableViewCell
@property (nonatomic, weak) id<WYJBaseTableViewCellDelegate> delegate;
@property (nonatomic,strong) UIImageView *nextImageView;
@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,assign) BOOL showNext;
@property (nonatomic,assign) BOOL showLine;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,assign) CGFloat bgSpace;
@property (nonatomic,assign) CGFloat lineSpace;
@property (nonatomic,assign) CGFloat bgHeight;
- (void)initBaseElement;
- (void)initElement;
@property (nonatomic,copy) void (^onReload)(id t);
///数据配置
- (void)configureWithData:(nullable id)data;
///用于代理事件触发
- (void)onTriggerEventWithId:(NSInteger)eventId;
@end

NS_ASSUME_NONNULL_END
