//
//  OneViewController.m

//  Created by 王祎境 on 2021/11/15.
//

#import "OneViewController.h"
#import "TwoViewController.h"
#import <Masonry/Masonry.h>
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
    WYJNavigationView * view = [WYJNavigationView.alloc init];
    
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pushViewController:TwoViewController.alloc.init animated:NO];
}

@end
