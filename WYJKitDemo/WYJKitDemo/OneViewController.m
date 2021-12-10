//
//  OneViewController.m

//  Created by 王King境 on 2021/11/15.
//

#import "OneViewController.h"
#import "TwoViewController.h"
#import <Masonry/Masonry.h>
#import "DSNDJNSDJSD.h"
@interface OneViewController ()

@end

@implementation OneViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"one";
    self.view.backgroundColor = UIColor.blueColor;
//    self.yi_prefersNavigationBarHidden = YES;
    [self setBackItem:[UIImage imageNamed:@"nav_back_black"] ];

    self.view = DSNDJNSDJSD.alloc.init;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pushViewController:TwoViewController.alloc.init animated:NO];
}

@end
