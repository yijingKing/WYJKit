//
//  UIControl+WYJActionBlocks.m
//  Created by King on 2021
//

#import "UIControl+WYJActionBlocks.h"
#import <objc/runtime.h>

static const void *UIControlActionBlockArray = &UIControlActionBlockArray;

@implementation WYJUIControlActionBlockWrapper

- (void)yi_invokeBlock:(id)sender {
    if (self.yi_actionBlock) {
        self.yi_actionBlock(sender);
    }
}
@end


@implementation UIControl (ActionBlocks)
-(void)yi_handleControlEvents:(UIControlEvents)controlEvents withBlock:(WYJUIControlActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    
    WYJUIControlActionBlockWrapper *blockActionWrapper = [[WYJUIControlActionBlockWrapper alloc] init];
    blockActionWrapper.yi_actionBlock = actionBlock;
    blockActionWrapper.yi_controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(yi_invokeBlock:) forControlEvents:controlEvents];
}


- (void)yi_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];
    
    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        WYJUIControlActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.yi_controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(yi_invokeBlock:) forControlEvents:controlEvents];
        }
    }];
    
    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
}


- (NSMutableArray *)actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, UIControlActionBlockArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, UIControlActionBlockArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}
@end

