//
//  DSNDJNSDJSD.m
//  WYJKitDemo
//
//  Created by King on 2021/12/10.
//

#import "DSNDJNSDJSD.h"
#import <Masonry/Masonry.h>
@implementation DSNDJNSDJSD

- (instancetype)init {
    if ([super init]) {
        
    }
    return self;
}
- (void)initSubviews {
    self.isUserEmpty = YES;
    self.isUseRefreshHeader = YES;
    self.isUseRefreshFooter = YES;
    [self getRefreshData];
}

/// 刷新
-(void)getRefreshData {
    [self.dataSource addObject:@[@"211232"]];
}
/// 加载更多
-(void)getMoreData {
//    [self.dataSource addObject:@[@"211232"]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
