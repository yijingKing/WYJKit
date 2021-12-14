//
//  ViewModel.m
//  WYJKitDemo
//
//  Created by 祎 on 2021/12/14.
//

#import "ViewModel.h"

@implementation ViewModel
- (WYJBaseTableViewDelegate *)baseDelegate {
    if (!_baseDelegate) {
        _baseDelegate = WYJBaseTableViewDelegate.alloc.init;
    }
    return _baseDelegate;
}

- (void)dasdad {
    
}

@end
