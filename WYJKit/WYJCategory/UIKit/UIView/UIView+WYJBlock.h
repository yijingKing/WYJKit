/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import <UIKit/UIKit.h>

typedef void (^WYJGestureActionBlock)(UIGestureRecognizer * gestureRecoginzer);
@interface UIView (WYJBlock)
/**
 *  @brief  添加tap手势
 *
 *  @param block 代码块
 */
- (void)yi_addTapActionWithBlock:(WYJGestureActionBlock)block;
/**
 *  @brief  添加长按手势
 *
 *  @param block 代码块
 */
- (void)yi_addLongPressActionWithBlock:(WYJGestureActionBlock)block;
@end


