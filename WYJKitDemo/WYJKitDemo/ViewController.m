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
//    UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    button.frame = self.view.frame;
//    button.backgroundColor = UIColor.grayColor;
//    [button setTitle:@"对对对" forState:(UIControlStateNormal)];
//    [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageWithColor:UIColor.blueColor] forState:normal];
//    [self.view addSubview:button];
    NSLog(@"%lf",WYJUIManager.shared.width);
//    UIButton cre
    [self.view addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        NSLog(@"1231232");
    }];
    
    UIButton * button = [UIButton createWithFrame:CGRectMake(100, 100, 100, 100) title:@"倒计时" titleColor:UIColor.redColor];
    [self.view addSubview:button];
    button.backgroundColor = UIColor.blueColor;
    [button startTime:10 completion:^(NSString * _Nonnull time) {
        NSLog(@"%@", time);
    } stopCompletion:^{
        NSLog(@"完成");
    }];
}


@end
