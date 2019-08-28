//
//  ViewController.m
//  YJKitDemo
//
//  Created by Eugene King on 2019/5/30.
//  Copyright © 2019 Eugene King. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)YJBaseTableView * tableView;
@property (nonatomic, assign)BOOL isL;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    [self.tableView wRefreshFooterWithRefreshingBlock:^{
        [self dis];
    }];
    [self.tableView wRefreshNormakHeaderWithRefreshingBlock:^{
        [self dis];
    }];
    
    [NSString chaptersDealWithString:@"123"];
    
//    self.tableView.hiddenTime = YES;
//    self.tableView.hiddenState = YES;
    WSCREEN_WIDTH
}

- (void)dis {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView wEndRefresh];
        [self.tableView wEndRefreshAndNoMoreData];
//        self.isL = YES;
        [self.tableView reloadData];
    });
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self setUploadPictures:^(UIImage * _Nonnull img) {
//
//    }];
}

#pragma mark -----  区头高度 -----
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0.01 : WRatioSize(10);
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
