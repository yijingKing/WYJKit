//
//  UIControl+WYJBlock.h
//  Created by 祎 on 2021
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (WYJBlock)
- (void)touchDown:(void (^)(void))eventBlock;
- (void)touchDownRepeat:(void (^)(void))eventBlock;
- (void)touchDragInside:(void (^)(void))eventBlock;
- (void)touchDragOutside:(void (^)(void))eventBlock;
- (void)touchDragEnter:(void (^)(void))eventBlock;
- (void)touchDragExit:(void (^)(void))eventBlock;
- (void)touchUpInside:(void (^)(void))eventBlock;
- (void)touchUpOutside:(void (^)(void))eventBlock;
- (void)touchCancel:(void (^)(void))eventBlock;
- (void)valueChanged:(void (^)(void))eventBlock;
- (void)editingDidBegin:(void (^)(void))eventBlock;
- (void)editingChanged:(void (^)(void))eventBlock;
- (void)editingDidEnd:(void (^)(void))eventBlock;
- (void)editingDidEndOnExit:(void (^)(void))eventBlock;
@end

NS_ASSUME_NONNULL_END
