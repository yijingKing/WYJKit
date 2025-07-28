/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>
#import "WYJBaseTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface WYJBaseBgTableViewCell : WYJBaseTableViewCell
@property (nonatomic,strong) UIImageView *nextImageView;
@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,assign) BOOL showNext;
@property (nonatomic,assign) BOOL showLine;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,assign) CGFloat bgCornerRadius;
///设置在bgEdge之前才有效
@property (nonatomic,assign) CGFloat bgHeight;
@property (nonatomic,assign) UIEdgeInsets bgEdge;

@property (nonatomic,assign) CGFloat lineSpace;
@end

NS_ASSUME_NONNULL_END
