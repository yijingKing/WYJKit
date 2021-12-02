/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef NSInteger(^WYJNumberForSection)(UITableView * tableView);
typedef NSInteger(^WYJNumberOfRowsInSection)(UITableView * tableView,NSInteger section);
typedef CGFloat(^WYJHeightForRowAtIndexPath)(UITableView * tableView,NSIndexPath * indexPath);
typedef UITableViewCell*_Nullable(^WYJCellForRowAtIndexPath)(UITableView * _Nullable tableView, NSIndexPath * _Nullable  indexPath);
typedef void(^WYJDidSelectRowAtIndexPath)(UITableView * _Nullable tableView, NSIndexPath * _Nullable  indexPath);
typedef CGFloat(^WYJHeightForHeaderInSection)(UITableView * tableView,NSInteger section);
typedef CGFloat(^WYJHeightForFooterInSection)(UITableView * tableView,NSInteger section);
typedef UIView*_Nullable(^WYJViewForHeaderInSection)(UITableView * tableView,NSInteger section);
typedef UIView*_Nullable(^WYJViewForFooterInSection)(UITableView * tableView,NSInteger section);

typedef void(^WYJWillDisplayCell)(UITableView * _Nullable tableView,UITableViewCell * cell, NSIndexPath * _Nullable  indexPath);

@interface WYJBaseTableViewDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy)WYJNumberForSection numberForSectionBlock;
@property (nonatomic, copy)WYJNumberOfRowsInSection numberOfRowsInSection;
@property (nonatomic, copy)WYJCellForRowAtIndexPath cellForRowAtIndexPath;
@property (nonatomic, copy)WYJHeightForRowAtIndexPath heightForRowAtIndexPath;
@property (nonatomic, copy)WYJDidSelectRowAtIndexPath didSelectRowAtIndexPath;
@property (nonatomic, copy)WYJHeightForHeaderInSection heightForHeaderInSection;
@property (nonatomic, copy)WYJHeightForFooterInSection heightForFooterInSection;
@property (nonatomic, copy)WYJViewForHeaderInSection viewForHeaderInSection;
@property (nonatomic, copy)WYJViewForFooterInSection viewForFooterInSection;
@property (nonatomic, copy)WYJWillDisplayCell willDisplayCell;
@end

NS_ASSUME_NONNULL_END
