/*
  Created by King on 2021
  Copyright © 2021年 King. All rights reserved.
*/

#import "WYJBaseView.h"
#import "WYJKitHeader.h"
#import <Masonry/Masonry.h>
@interface WYJBaseView ()
/// //判断是否加载中
@property (nonatomic ,assign)BOOL isLoading;
@end

@implementation WYJBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubviews];
        [self makeConstraint];
    }
    return self;
}
#pragma make --- 属性 ---
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)initSubviews {
    
}

- (void)makeConstraint {
    
}

@end
