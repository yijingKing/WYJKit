/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJBaseView.h"

@implementation WYJBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubviews];
        [self makeContraints];
        
        ///添加单击手势监听
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        singleTap.numberOfTouchesRequired = 1; //手指数
        singleTap.numberOfTapsRequired = 1; //tap次数
        [self addGestureRecognizer:singleTap];
    }
    return self;
}

- (void)tapGesture:(UITapGestureRecognizer *)tap {
    if (self.tapClickBlock) {
        self.tapClickBlock();
    }
}


- (void)initSubviews {
    
}

- (void)makeContraints {
    
}

- (void)configurationData:(id)data {
    
}

@end
