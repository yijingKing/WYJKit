//
//  ViewController.m

//  Created by PZ-IMAC-1 on 2021/11/2.
//

#import "ViewController.h"
#import "OneViewController.h"
#import <ReactiveObjC.h>
@interface ViewController ()
@property (nonatomic,strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavTitle:@"测试" color:UIColor.redColor];
    [self setNavTitle:@"导航" color:UIColor.blueColor font:PFRFontWithSizes(20)];
    [self setNavLeftItemWithTitle:@"返回" actionBlock:^{
        
    }];
    self.view.backgroundColor = UIColor.redColor;
    UIButton * button = [UIButton yi_createWithFrame:CGRectMake(100, 100, 100, 100) title:@"倒计时" titleColor:UIColor.redColor];
    button.yi_font = PFRFontWithSizes(30);
    [self.view addSubview:button];
    button.backgroundColor = UIColor.blueColor;
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        YJDEBUG(@"1111");
        self.label.text = @"mmmm";
        [self buttonClick:button];
    }];
    
    [self.view addSubview:self.label];
    
    [RACObserve(self.label, text) subscribeNext:^(id  _Nullable x) {
        YJDEBUG(@"label值改变");
    }];
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:UIKeyboardWillShowNotification object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        YJDEBUG(@"通知");
    }];
    
    [[self rac_signalForSelector:@selector(buttonClick:)] subscribeNext:^(RACTuple * _Nullable x) {
        YJDEBUG(@"事件触发");
    }];
    
//    [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
//        self.label.text = @"3";
//    }];
    
    UITextField * tf = UITextField.alloc.init;
    tf.frame = CGRectMake(100, 320, 100, 100);
    [self.view addSubview:tf];
//    RAC(button, backgroundColor) = [RACSignal combineLatest:@[tf.rac_textSignal.text] reduce:^id _Nullable(NSString * username){
//            return (username.integerValue == 3) ? [UIColor redColor] : [UIColor grayColor];
//        }];
}
- (void)buttonClick:(UIButton *)sender {
    YJDEBUG(@"点击");
    [self pushViewController:OneViewController.alloc.init animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self pushViewController:OneViewController.alloc.init animated:YES];
}


- (UILabel *)label {
    if (!_label) {
        _label = UILabel.alloc.init;
        _label.frame = CGRectMake(100, 220, 100, 100);
        _label.backgroundColor = UIColor.grayColor;
        _label.text = @"ddkkdkkd";
    }
    return _label;
}
@end
