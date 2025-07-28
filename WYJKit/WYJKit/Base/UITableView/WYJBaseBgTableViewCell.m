/*
  Created by 祎 on 2021
  Copyright © 2021年 祎. All rights reserved.
*/

#import "WYJBaseBgTableViewCell.h"
#import <Masonry/Masonry.h>
#import "WYJMacroHeader.h"
#import "UIColorHeader.h"
@interface WYJBaseBgTableViewCell ()

@end

@implementation WYJBaseBgTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self normalElement];
}


- (void)normalElement {
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(YJRatio(12));
        make.right.mas_equalTo(-YJRatio(12));
        make.top.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView).priority(MASLayoutPriorityDefaultLow);
    }];
    [self.contentView addSubview:self.nextImageView];
    [self.nextImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bgView.mas_right).offset(-YJRatio(12));
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(YJRatio(5));
        make.height.mas_equalTo(YJRatio(9));
    }];
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView.mas_left).offset(YJRatio(12));
        make.right.mas_equalTo(self.bgView.mas_right).offset(-YJRatio(12));
        make.bottom.mas_equalTo(self.bgView);
        make.height.mas_equalTo(1);
    }];
    [self.contentView sendSubviewToBack:self.bgView];
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

- (void)setLineSpace:(CGFloat)lineSpace {
    _lineSpace = lineSpace;
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lineSpace);
        make.right.mas_equalTo(-lineSpace);
        make.bottom.mas_equalTo(self.bgView);
        make.height.mas_equalTo(1);
    }];
}
- (void)setBgCornerRadius:(CGFloat)bgCornerRadius {
    _bgCornerRadius = bgCornerRadius;
    self.bgView.layer.cornerRadius = bgCornerRadius;
    self.bgView.layer.masksToBounds = YES;
}

- (void)setBgEdge:(UIEdgeInsets)bgEdge {
    _bgEdge = bgEdge;
    if (self.bgHeight > 0) {
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(bgEdge.left);
            make.right.mas_equalTo(bgEdge.right);
            make.top.mas_equalTo(bgEdge.top);
            make.height.mas_equalTo(self.bgHeight);
            make.bottom.mas_equalTo(bgEdge.bottom).priority(MASLayoutPriorityDefaultLow);
        }];
    } else {
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(bgEdge.left);
            make.right.mas_equalTo(bgEdge.right);
            make.top.mas_equalTo(bgEdge.top);
            make.bottom.mas_equalTo(bgEdge.bottom).priority(MASLayoutPriorityDefaultLow);
        }];
    }
}

- (void)setShowLine:(BOOL)showLine {
    _showLine = showLine;
    self.lineView.hidden = !showLine;
}
- (void)setShowNext:(BOOL)showNext {
    _showNext = showNext;
    self.nextImageView.hidden = !showNext;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = WHexColor(0xCAC8C8);
        _lineView.hidden = YES;
    }
    return _lineView;
}
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = UIColor.whiteColor;
    }
    return _bgView;
}

- (UIImageView *)nextImageView {
    if (!_nextImageView) {
        _nextImageView = [UIImageView new];
        _nextImageView.hidden = YES;
        _nextImageView.image = [UIImage imageNamed:@"home-more"];
    }
    return _nextImageView;
}

@end
