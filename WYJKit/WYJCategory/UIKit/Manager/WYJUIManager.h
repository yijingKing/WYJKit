/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WYJUIManager : NSObject

+(instancetype)shared;

/// 适配屏幕宽度--默认375
@property (nonatomic,assign) CGFloat width;


@end


