//
//  OneViewController.m
//  WYJKitDemo
//
//  Created by 王祎境 on 2021/11/15.
//

#import "OneViewController.h"
#import "TwoViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"one";
    self.view.backgroundColor = UIColor.blueColor;
    self.yi_prefersNavigationBarHidden = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pushViewController:TwoViewController.alloc.init animated:NO];
}


@end
