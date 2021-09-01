//
//  sjkfaViewController.m
//  YJKitDemo
//
//  Created by Mac on 2020/7/23.
//  Copyright © 2020 Eugene King. All rights reserved.
//

#import "sjkfaViewController.h"
#import "ViewController.h"
@interface sjkfaViewController ()<sjkfa>

@end

@implementation sjkfaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackItem:[UIImage imageNamed:@"返 回"]];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.delegate respondsToSelector:@selector(logDemo)]) {
        
    }
    
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
