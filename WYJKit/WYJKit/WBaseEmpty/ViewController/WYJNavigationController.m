//
//  YJNavigationController.m
//  YJKitDemo
//
//  Created by Mac on 2020/5/29.
//  Copyright © 2020 Eugene King. All rights reserved.
//

#import "WYJNavigationController.h"

@interface WYJNavigationController ()

@end

@implementation WYJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
