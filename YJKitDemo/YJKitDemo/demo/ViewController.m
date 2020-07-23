//
//  ViewController.m
//  YJKitDemo
//
//  Created by Eugene King on 2019/5/30.
//  Copyright © 2019 Eugene King. All rights reserved.
//

#import "ViewController.h"

#import "sjkfaViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)YJBaseTableView * tableView;
@property (nonatomic, assign)BOOL isL;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.lightGrayColor;
    
//    [self.view addSubview:self.tableView];
//    [self.tableView yi_refreshFooterWithRefreshingBlock:^{
//        [self dis];
//    }];
//    [self.tableView wRefreshNormakHeaderWithRefreshingBlock:^{
//        [self dis];
//    }];
    
//    [NSString yi_chaptersDealWithString:@"123"];
    
//    self.tableView.yi_hiddenTime = YES;
//    self.tableView.yi_hiddenState = YES;
    
    
    UIButton * tv = [UIButton.alloc initWithFrame:CGRectMake(0, 100, 100, 44)];
    tv.backgroundColor = UIColor.redColor;
    tv.yi_titleText = @"ewdsdsa";
    tv.yi_titleColor = UIColor.blueColor;
    
    [self.view addSubview:tv];
    
//    [self setNavTitleView:tv];
    
    [self yi_setNavLeftItemsWithImages:@[[UIImage imageNamed:@"common_btn_collect_selected"],[UIImage imageNamed:@"common_btn_collect_selected"],[UIImage imageNamed:@"common_btn_collect_selected"]] actionBlock:^(NSInteger tag) {
        NSLog(@"qwqqq===%ld",tag);
    }];
    
    [self yi_setNavRightItemsWithImages:@[[UIImage imageNamed:@"common_btn_collect_selected"],[UIImage imageNamed:@"common_btn_collect_selected"],[UIImage imageNamed:@"common_btn_collect_selected"]] actionBlock:^(NSInteger tag) {
        NSLog(@"qwwczzzzzzzzzzzzqq===%ld",tag);
        }];
//    [self yi_setNavLeftItemsWithTitles:@[@"213",@"213123e"] action:@selector(aaaa)];
}
- (void)aaaa {
    NSLog(@"weqweeeeee");
}
- (void)dis {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView yi_endRefresh];
        [self.tableView yi_endRefreshAndNoMoreData];
//        self.isL = YES;
        [self.tableView reloadData];
    });
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self yi_setUploadPictures:^(UIImage * _Nonnull img) {
//
//    }];
    [self pushViewController:sjkfaViewController.alloc.init animated:YES];
}

#pragma mark -----  区头高度 -----
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark -----  区头视图 -----
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return UIView.new;
}

#pragma mark -----  区数 -----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.isL ? 0 : 1;
}

#pragma mark -----  行数 -----
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

#pragma mark -----  单元格高度 -----
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

#pragma mark -----  单元格 -----
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

#pragma mark -----  单元格点击事件 -----
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return UIView.new;
}

- (YJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [YJBaseTableView.alloc initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView.alloc init];
        _tableView.estimatedRowHeight = 100;
        _tableView.backgroundColor = UIColor.clearColor;
    }
    return _tableView;
}

@end
