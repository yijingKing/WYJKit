//
//  ViewController.m
//  WYJKitDemo
//
//  Created by PZ-IMAC-1 on 2021/11/2.
//

#import "ViewController.h"
#import "WYJKitHeader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = self.view.frame;
    button.backgroundColor = UIColor.grayColor;
    [button setTitle:@"对对对" forState:(UIControlStateNormal)];
    [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageWithColor:UIColor.blueColor] forState:normal];
    [self.view addSubview:button];
    NSLog(@"%lf",WYJUIManager.shared.width);
}


@end
