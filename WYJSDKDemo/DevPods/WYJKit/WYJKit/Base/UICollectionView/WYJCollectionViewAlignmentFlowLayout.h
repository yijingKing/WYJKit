/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum MLHorizonalType : NSInteger WYJHorizonalType;
enum MLHorizonalType :NSInteger {
    WYJHorizonalCenter = 0,
    WYJHorizonalLeft = 1,
    WYJHorizonalRight = 2,
};
@interface WYJCollectionViewAlignmentFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) WYJHorizonalType horizonalType;
@end

NS_ASSUME_NONNULL_END
