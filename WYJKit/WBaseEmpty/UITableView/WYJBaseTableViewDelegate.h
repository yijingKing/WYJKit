/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

typedef NSInteger(^NumberForSection)(UITableView * tableView);
typedef NSInteger(^NumberOfRowsInSection)(UITableView * tableView,NSInteger section);
typedef CGFloat(^HeightForRowAtIndexPath)(UITableView * tableView,NSIndexPath * indexPath);
typedef UITableViewCell*_Nullable(^CellForRowAtIndexPath)(UITableView * _Nullable tableView, NSIndexPath * _Nullable  indexPath);
typedef void(^DidSelectRowAtIndexPath)(UITableView * _Nullable tableView, NSIndexPath * _Nullable  indexPath);
typedef CGFloat(^HeightForHeaderInSection)(UITableView * tableView,NSInteger section);
typedef CGFloat(^HeightForFooterInSection)(UITableView * tableView,NSInteger section);
typedef UIView*_Nullable(^ViewForHeaderInSection)(UITableView * tableView,NSInteger section);
typedef UIView*_Nullable(^ViewForFooterInSection)(UITableView * tableView,NSInteger section);

@interface WYJBaseTableViewDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, copy)NumberForSection numberForSectionBlock;
@property (nonatomic, copy)NumberOfRowsInSection numberOfRowsInSection;
@property (nonatomic, copy)CellForRowAtIndexPath cellForRowAtIndexPath;
@property (nonatomic, copy)HeightForRowAtIndexPath heightForRowAtIndexPath;
@property (nonatomic, copy)DidSelectRowAtIndexPath didSelectRowAtIndexPath;
@property (nonatomic, copy)HeightForHeaderInSection heightForHeaderInSection;
@property (nonatomic, copy)HeightForFooterInSection heightForFooterInSection;
@property (nonatomic, copy)ViewForHeaderInSection viewForHeaderInSection;
@property (nonatomic, copy)ViewForFooterInSection viewForFooterInSection;
@end

NS_ASSUME_NONNULL_END
