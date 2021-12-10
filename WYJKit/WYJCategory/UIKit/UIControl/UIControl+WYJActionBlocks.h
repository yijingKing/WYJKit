//
//  UIControl+WYJActionBlocks.h
//  Created by King on 2021
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^WYJUIControlActionBlock)(id weakSender);


@interface WYJUIControlActionBlockWrapper : NSObject
@property (nonatomic, copy) WYJUIControlActionBlock yi_actionBlock;
@property (nonatomic, assign) UIControlEvents yi_controlEvents;
- (void)yi_invokeBlock:(id)sender;
@end

@interface UIControl (WYJActionBlocks)
- (void)yi_handleControlEvents:(UIControlEvents)controlEvents withBlock:(WYJUIControlActionBlock)actionBlock;
- (void)yi_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;
@end

NS_ASSUME_NONNULL_END
