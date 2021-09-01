//
//  ViewController.m
//  YJKitDemo
//
//  Created by Eugene King on 2019/5/30.
//  Copyright © 2019 Eugene King. All rights reserved.
//

#import "ViewController.h"

#import "sjkfaViewController.h"

@interface ViewController ()
@property (nonatomic, assign)BOOL isL;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.lightGrayColor;
    

    
    [self addTableView];
    
    [self.mainTableView numberForSection:^NSInteger{
        return self.isL ? 3 : 5;
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.isL = !self.isL;
    self.mainTableView.reloadData;
//    [self yi_setUploadPictures:^(UIImage * _Nonnull img) {
//
//    }];
//    sjkfaViewController * vc = sjkfaViewController.alloc.init;
//    vc.delegate = self;
//    [self pushViewController:vc animated:YES];
}
- (void)logDemo {
    WYJLog(@"weqweeeeee");
}

//#pragma mark -----  区头高度 -----
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0.01;
//}

#pragma mark -----  区头视图 -----
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return UIView.new;
//}
//
//#pragma mark -----  区数 -----
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.isL ? 0 : 1;
//}
//
//#pragma mark -----  行数 -----
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 10;
//}

//#pragma mark -----  单元格高度 -----
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewAutomaticDimension;
//}
//
//#pragma mark -----  单元格 -----
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return [[UITableViewCell alloc] init];
//}
//
//#pragma mark -----  单元格点击事件 -----
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.01;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return UIView.new;
//}

//- (YJBaseTableView *)tableView {
//    if (!_tableView) {
//        _tableView = [YJBaseTableView.alloc initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        _tableView.tableFooterView = [UIView.alloc init];
//        _tableView.estimatedRowHeight = 100;
//        _tableView.backgroundColor = UIColor.clearColor;
//    }
//    return _tableView;
//}

@end
