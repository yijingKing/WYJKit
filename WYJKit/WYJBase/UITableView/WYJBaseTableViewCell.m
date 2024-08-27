//
//  BaseTableViewCell.m
//  LCProduct
//
//  Created by 王祎境 on 2024/6/18.
//

#import "WYJBaseTableViewCell.h"
#import <Masonry/Masonry.h>
#import "WYJMacroHeader.h"
#import "UIColorHeader.h"
@interface WYJBaseTableViewCell ()

@end

@implementation WYJBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = UIColor.clearColor;
    [self normalElement];
    [self initElement];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColor.clearColor;
        [self normalElement];
        [self initElement];
    }
    return self;
}
- (void)normalElement {
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(YJRatio(15));
        make.right.mas_equalTo(-YJRatio(15));
        make.top.mas_equalTo(self.contentView);
        make.bottom.mas_equalTo(self.contentView).priority(MASLayoutPriorityDefaultLow);
    }];
    [self.contentView addSubview:self.nextImageView];
    [self.nextImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.bgView.mas_right).offset(-YJRatio(16));
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
    self.bgSpace = YJRatio(15);
    [self.contentView sendSubviewToBack:self.bgView];
}
- (void)initElement {
    
}
- (void)setLineSpace:(CGFloat)lineSpace {
    _lineSpace = lineSpace;
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgSpace);
        make.right.mas_equalTo(-self.bgSpace);
        make.bottom.mas_equalTo(self.bgView);
        make.height.mas_equalTo(1);
    }];
}
- (void)setBgHeight:(CGFloat)bgHeight {
    _bgHeight = bgHeight;
    [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgSpace);
        make.right.mas_equalTo(-self.bgSpace);
        make.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(bgHeight);
        make.bottom.mas_equalTo(self.contentView).priority(MASLayoutPriorityDefaultLow);
    }];
}
- (void)setBgSpace:(CGFloat)bgSpace {
    _bgSpace = bgSpace;
    if (self.bgHeight > 0) {
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(YJRatio(bgSpace));
            make.right.mas_equalTo(-YJRatio(bgSpace));
            make.top.mas_equalTo(self.contentView);
            make.height.mas_equalTo(self.bgHeight);
            make.bottom.mas_equalTo(self.contentView).priority(MASLayoutPriorityDefaultLow);
        }];
    } else {
        [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(YJRatio(bgSpace));
            make.right.mas_equalTo(-YJRatio(bgSpace));
            make.top.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(self.contentView).priority(MASLayoutPriorityDefaultLow);
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
