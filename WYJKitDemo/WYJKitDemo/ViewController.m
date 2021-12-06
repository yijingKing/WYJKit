//
//  ViewController.m

//  Created by PZ-IMAC-1 on 2021/11/2.
//

#import "ViewController.h"
#import "OneViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:@"测试" color:UIColor.redColor];
    [self setNavTitle:@"导航" color:UIColor.blueColor font:PFRFontWithSizes(20)];
    [self setNavLeftItemWithTitle:@"返回" actionBlock:^{
        
    }];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.redColor;
//    UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    button.frame = self.view.frame;
//    button.backgroundColor = UIColor.grayColor;
//    [button setTitle:@"对对对" forState:(UIControlStateNormal)];
//    [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIImage imageWithColor:UIColor.blueColor] forState:normal];
//    [self.view addSubview:button];
//    NSLog(@"%lf",WYJUIManager.shared.width);
//    [self.view addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
//        NSLog(@"1231232");
//    }];
//
    UIButton * button = [UIButton yi_createWithFrame:CGRectMake(100, 100, 100, 100) title:@"倒计时" titleColor:UIColor.redColor];
    button.yi_font = PFRFontWithSizes(30);
    [self.view addSubview:button];
    button.backgroundColor = UIColor.blueColor;
//    [button yi_startTime:10 completion:^(NSString * _Nonnull time) {
//        NSLog(@"%@", time);
//    } stopCompletion:^{
//        NSLog(@"完成");
//    }];
//    [button yi_addTargetUpInside:self action:@selector(buttonClick:)];
    button.yi_eventInterval = 2;
//    UILabel * label = [UILabel createWithText:@"" color:UIColor.redColor font:nil];
    
//    self.dataSource = [NSMutableArray arrayWithArray:@[@[@"1",@"1",@"1"],@[@"1",@"1",@"1",@"1",@"1"]]];
//    [self addTableView];
//    
//    [self.mainTableView heightForRowAtIndexPath:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
//        return 99;
//    }];
//    
//    [self.mainTableView cellForRowAtIndexPath:^UITableViewCell * _Nullable(UITableView * _Nullable tableView, NSIndexPath * _Nullable indexPath) {
//        UITableViewCell * cell = UITableViewCell.alloc .init;
//        cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
//        return cell;
//    }];
    
//
//    WYJBaseView * baseView = [WYJBaseView.alloc initWithFrame:self.view.bounds];
//    [self.view addSubview:baseView];
//    baseView.tapClickBlock = ^{
//        YJDEBUG(@"taptaptap");
//    };
    
}
- (void)buttonClick:(UIButton *)sender {
    YJDEBUG(@"1111");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pushViewController:OneViewController.alloc.init animated:YES];
}
@end
