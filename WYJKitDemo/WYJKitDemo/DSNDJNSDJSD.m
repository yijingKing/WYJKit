//
//  DSNDJNSDJSD.m
//  WYJKitDemo
//
//  Created by King on 2021/12/10.
//

#import "DSNDJNSDJSD.h"
#import <Masonry/Masonry.h>
@implementation DSNDJNSDJSD

- (instancetype)init {
    if ([super init]) {
        
    }
    return self;
}
- (void)initSubviews {
    self.isUserEmpty = YES;
    self.isUseRefreshHeader = YES;
    self.isUseRefreshFooter = YES;
    [self addTableView];
    self.mainTableView.backgroundColor = UIColor.blueColor;
    self.mainTableView.emptyTitle = @"eweqewqe";
    
    [self.mainTableView yi_heightForRowAtIndexPath:^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 60;
    }];
    [self.mainTableView yi_cellForRowAtIndexPath:^UITableViewCell * _Nullable(UITableView * _Nullable tableView, NSIndexPath * _Nullable indexPath) {
        UITableViewCell * cell = UITableViewCell.alloc.init;
        cell.backgroundColor = UIColor.redColor;
        return cell;
    }];
    [self getRefreshData];
}

/// 刷新
-(void)getRefreshData {
    [self.dataSource addObject:@[@"211232"]];
    [self.mainTableView endRefresh];
    [self.mainTableView reloadData];
}
/// 加载更多
-(void)getMoreData {
//    [self.dataSource addObject:@[@"211232"]];
    [self.mainTableView endRefresh];
    [self.mainTableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
