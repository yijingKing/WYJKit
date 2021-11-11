/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

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
