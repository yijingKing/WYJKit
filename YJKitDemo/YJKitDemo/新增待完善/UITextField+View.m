//
//  UITextField+View.m
//  Zeus
//
//  Created by PZ-IMAC-1 on 2021/9/2.
//  Copyright © 2021 apple. All rights reserved.
//

#import "UITextField+View.h"

@implementation UITextField (View)


- (void)addLeftView:(NSString *)text color:(UIColor *)color image:(UIImage *)image size:(CGSize)size {
    UIView * view = [UIView.alloc initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    UIButton * button = [UIButton.alloc initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    button.yi.titleText = text;
    button.yi.titleColor = color;
    button.yi.image = image;
    [view addSubview:button];
    self.leftView = view;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
