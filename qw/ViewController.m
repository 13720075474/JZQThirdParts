//
//  ViewController.m
//  qw
//
//  Created by 贾子权 on 2018/3/27.
//  Copyright © 2018年 JLSJ.Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _label.text = @"我的题啊发啊剡地方啊剡放大舒服发舒服啊说法发发丝非法所得分撒剡放大舒服发舒服啊说法发发丝非法所得分撒剡放大舒服发舒服啊说法发发丝非法所得分撒剡放大舒服发舒服啊说法发发丝非法所得分撒剡放大舒服发舒服啊说法发发丝非法所得分撒";
    [_label.superview
     layoutIfNeeded];
    NSLog(@"%lf",_label.frame.size.height);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
