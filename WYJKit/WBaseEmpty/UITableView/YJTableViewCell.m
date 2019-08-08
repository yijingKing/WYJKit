/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ 
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/


#import "YJTableViewCell.h"

@implementation YJTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    for (UIView *view in self.subviews) {
        if([view isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)view).delaysContentTouches = NO; // Remove touch delay for iOS 7
            break;
        }
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
//    self.backgroundView.backgroundColor = [UIColor clearColor];
//    self.contentView.backgroundColor = [UIColor clearColor];
//    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.dividerView];
    return self;
}


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    self.dividerView.frame = CGRectMake(0, 0, rect.size.width - 24, 1);
    self.dividerView.center = CGPointMake(rect.size.width / 2, rect.size.height - 0.5);
}

- (UIView *)dividerView {
    if (!_dividerView) {
        _dividerView = UIView.alloc.init;
        _dividerView.backgroundColor = [UIColor colorWithRed:239 / 255.0 green:239 / 255.0  blue:239 / 255.0 alpha:1];
        _dividerView.hidden = YES;
    }
    return _dividerView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
