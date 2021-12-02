/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/
#import "WYJUIManager.h"

@implementation WYJUIManager
static WYJUIManager * _instace;
+ (instancetype)shared {
    if (!_instace) {
        _instace = [[WYJUIManager alloc]init];
        _instace.width = 375;
    }
    return _instace;
}


@end
