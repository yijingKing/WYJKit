//
//  UIView+YJDeepCopy.m
//  LCProduct
//
//  Created by 祎 on 2025/2/11.
//

#import "UIView+YJDeepCopy.h"

@implementation UIView (YJDeepCopy)
- (id)yi_deepCopyView {
    if (!self) return nil;
    
    // 尝试归档和解档
    NSError *archiveError = nil;
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:NO error:&archiveError];
    if (!archiveError && archivedData) {
        NSError *unarchiveError = nil;
        UIView *newView = [NSKeyedUnarchiver unarchivedObjectOfClass:[self class] fromData:archivedData error:&unarchiveError];
        if (!unarchiveError && newView) {
            return newView;
        }
        NSLog(@"解档失败：%@", unarchiveError.localizedDescription);
    } else {
        NSLog(@"归档失败：%@", archiveError.localizedDescription);
    }
    
    // 如果归档解档失败，尝试从 XIB 重新加载并复制子视图
    UIView *xibView = [self yi_loadFromNib];
    if (xibView) {
        [self yi_copyPropertiesFromView:self toView:xibView];
        return xibView;
    }
    
    // 最后降级为简单复制
    return [self yi_manualDeepCopy];
}

// 手动深拷贝，复制常见属性和子视图
- (UIView *)yi_manualDeepCopy {
    UIView *newView = [[self.class alloc] initWithFrame:self.frame];
    [self yi_copyPropertiesFromView:self toView:newView];
    return newView;
}

// 从 XIB 加载视图
- (UIView *)yi_loadFromNib {
    NSString *className = NSStringFromClass([self class]);
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    if ([bundle pathForResource:className ofType:@"nib"]) {
        return [[bundle loadNibNamed:className owner:nil options:nil] firstObject];
    }
    return nil;
}

// 复制视图属性（适用于 XIB 的视图）
- (void)yi_copyPropertiesFromView:(UIView *)sourceView toView:(UIView *)targetView {
    targetView.backgroundColor = sourceView.backgroundColor;
    targetView.clipsToBounds = sourceView.clipsToBounds;
    targetView.layer.cornerRadius = sourceView.layer.cornerRadius;
    targetView.layer.borderWidth = sourceView.layer.borderWidth;
    targetView.layer.borderColor = sourceView.layer.borderColor;
    targetView.alpha = sourceView.alpha;
    
    // 特殊处理 UILabel 和 UIButton 的属性
    if ([sourceView isKindOfClass:[UILabel class]] && [targetView isKindOfClass:[UILabel class]]) {
        UILabel *sourceLabel = (UILabel *)sourceView;
        UILabel *targetLabel = (UILabel *)targetView;
        
        targetLabel.text = sourceLabel.text;
        targetLabel.textColor = sourceLabel.textColor;
        targetLabel.font = sourceLabel.font;
        targetLabel.textAlignment = sourceLabel.textAlignment;
        targetLabel.numberOfLines = sourceLabel.numberOfLines;
        targetLabel.attributedText = sourceLabel.attributedText;
    } else if ([sourceView isKindOfClass:[UIButton class]] && [targetView isKindOfClass:[UIButton class]]) {
        UIButton *sourceButton = (UIButton *)sourceView;
        UIButton *targetButton = (UIButton *)targetView;
        
        [targetButton setTitle:[sourceButton titleForState:UIControlStateNormal] forState:UIControlStateNormal];
        [targetButton setTitleColor:[sourceButton titleColorForState:UIControlStateNormal] forState:UIControlStateNormal];
        targetButton.titleLabel.font = sourceButton.titleLabel.font;
        targetButton.backgroundColor = sourceButton.backgroundColor;
        targetButton.contentEdgeInsets = sourceButton.contentEdgeInsets;
    }
}


@end
