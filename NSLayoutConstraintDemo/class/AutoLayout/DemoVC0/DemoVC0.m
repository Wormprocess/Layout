//
//  DemoVC0.m
//  NSLayoutConstraintDemo
//
//  Created by dome on 2017/12/14.
//  Copyright © 2017年 Tsunami. All rights reserved.
//

#import "DemoVC0.h"

@interface DemoVC0 ()

@property (nonatomic,weak) UIView * view0;
@property (nonatomic,weak) UIView * view1;
@property (nonatomic,weak) UIView * view2;
@property (nonatomic,weak) UIView * view3;
@property (nonatomic,strong) NSLayoutConstraint * view0_width;
@property (nonatomic,strong) NSTimer * time;
@end

@implementation DemoVC0
- (void)dealloc
{
    [self.time invalidate];
    self.time = nil;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIView * view0 = [UIView new];
    view0.backgroundColor = [UIColor cyanColor];
    self.view0 = view0;
    [self.view addSubview:view0];
    
    UIView * view1 = [UIView new];
    view1.backgroundColor = [UIColor cyanColor];
    self.view1 = view1;
    [self.view addSubview:view1];
    
    
    UIView * view2 = [UIView new];
    view2.backgroundColor = [UIColor cyanColor];
    self.view2 = view2;
    [self.view addSubview:view2];
    
    
    UIView * view3 = [UIView new];
    view3.backgroundColor = [UIColor cyanColor];
    self.view3 = view3;
    [self.view0 addSubview:view3];
    self.view0.translatesAutoresizingMaskIntoConstraints = NO;
    self.view1.translatesAutoresizingMaskIntoConstraints = NO;
    self.view2.translatesAutoresizingMaskIntoConstraints = NO;
    self.view3.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self createLayoutConstraint];
    T_WeakSelf(self);
    self.time = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakself startAnimation];
    }];
    
}

- (void)startAnimation
{
    if (self.view0_width.constant == 10.0) {
        self.view0_width.constant = 100.0;
    }else{
        self.view0_width.constant = 10.0;
    }
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}
- (void)createLayoutConstraint
{
    NSLayoutConstraint * view0_top = [NSLayoutConstraint constraintWithItem:self.view0 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:60];
    NSLayoutConstraint * view0_left = [NSLayoutConstraint constraintWithItem:self.view0 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    NSLayoutConstraint * view0_width = [NSLayoutConstraint constraintWithItem:self.view0 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    view0_width.identifier = @"width";
    NSLayoutConstraint * view0_height = [NSLayoutConstraint constraintWithItem:self.view0 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    self.view0_width = view0_width;
    [self.view addConstraints:@[view0_top,view0_left,view0_width,view0_height]];
    //addConstraints之后  active就被激活了。可以手动设置active为yes，可以不用addConstraints也有效。例如view0_height.active = YES;后self.view就不用添加view0_height也会有效
    
    
    NSString * view1_Hvfl = @"H:[view0]-10-[view1(==view0)]-10-[view2(50)]";
    NSDictionary * views = @{@"view0":self.view0,@"view1":self.view1,@"view2":self.view2};
    NSArray * constrs = [NSLayoutConstraint constraintsWithVisualFormat:view1_Hvfl options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:nil views:views];
    [self.view addConstraints:constrs];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
