/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import <UIKit/UIKit.h>

@interface UIView (WYJConvenience)
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;

- (void)yi_addSubviews:(NSArray <UIView *>*)array;

@end


