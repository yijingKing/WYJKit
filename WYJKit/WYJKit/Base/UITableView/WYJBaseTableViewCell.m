/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJBaseTableViewCell.h"
@interface WYJBaseTableViewCell ()

@end

@implementation WYJBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self normalElement];
    [self initBaseElement];
    [self initElement];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        [self normalElement];
        [self initBaseElement];
        [self initElement];
    }
    return self;
}



- (void)normalElement {
    
}
- (void)initBaseElement {
    
}
- (void)initElement {
    
}
- (void)configureWithData:(nullable id)data {
    
}

- (void)onTriggerEventWithId:(NSInteger)eventId {
    if ([self.delegate respondsToSelector:@selector(baseCell:didTriggerEventWithId:)]) {
        [self.delegate baseCell:self didTriggerEventWithId:eventId];
    }
}

@end
