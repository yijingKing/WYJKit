/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
  GitHub: https://github.com/MemoryKing
*/

#import "WYJBaseView.h"

@implementation WYJBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubviews];
        [self makeContraints];
    }
    return self;
}

- (void)initSubviews {
    
}

- (void)makeContraints {
    
}

- (void)configurationData:(id)data {
    
}

@end
