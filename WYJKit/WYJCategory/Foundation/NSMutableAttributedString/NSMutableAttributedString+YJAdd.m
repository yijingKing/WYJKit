//
//  NSMutableAttributedString+YJAdd.m
//  AFNetworking
//
//  Created by 祎 on 2024/8/27.
//

#import "NSMutableAttributedString+YJAdd.h"
#import <objc/runtime.h>
@implementation NSMutableAttributedString (YJAdd)

- (void)k_setHighlightForTexts:(NSArray<NSString *> *)texts
                       color:(UIColor *)color
            backgroundColor:(UIColor *)backgroundColor
                  tapHandler:(void (^)(NSString *text, NSRange range))tapHandler {
    for (NSString *text in texts) {
        NSRange range = [self.string rangeOfString:text];
        if (range.location != NSNotFound) {
            [self addAttribute:NSForegroundColorAttributeName value:color range:range];
            if (backgroundColor) {
                [self addAttribute:NSBackgroundColorAttributeName value:backgroundColor range:range];
            }
            UILabel *label = [UILabel new];
            label.attributedText = self;
            label.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapOnLabel:)];
            [label addGestureRecognizer:tapGesture];
            objc_setAssociatedObject(label, @"tapHandler", tapHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
        }
    }
}

- (void)handleTapOnLabel:(UITapGestureRecognizer *)gesture {
    UILabel *label = (UILabel *)gesture.view;
    CGPoint location = [gesture locationInView:label];
    NSAttributedString *attributedString = label.attributedText;
    CGRect textRect = [label.text boundingRectWithSize:label.bounds.size
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName : label.font}
                                               context:nil];
    
    if (CGRectContainsPoint(textRect, location)) {
        void (^tapHandler)(NSString *, NSRange) = objc_getAssociatedObject(label, @"tapHandler");
        if (tapHandler) {
            NSRange range = NSMakeRange(0, attributedString.length);
            tapHandler([attributedString.string substringWithRange:range], range);
        }
    }
}

@end
