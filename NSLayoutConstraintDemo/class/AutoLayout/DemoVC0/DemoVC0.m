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

@end

@implementation DemoVC0

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
}
- (void)createLayoutConstraint
{
    NSLayoutConstraint * view0_top = [NSLayoutConstraint constraintWithItem:self.view0 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:60];
    view0_top.active = YES;
    NSLayoutConstraint * view0_left = [NSLayoutConstraint constraintWithItem:self.view0 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    view0_left.active = YES;
    NSLayoutConstraint * view0_width = [NSLayoutConstraint constraintWithItem:self.view0 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    view0_width.active = YES;
    view0_width.identifier = @"width";
    NSLayoutConstraint * view0_height = [NSLayoutConstraint constraintWithItem:self.view0 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    view0_height.active = YES;
    
//    [self.view addConstraints:@[view0_top,view0_left,view0_width,view0_height]];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view0.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.identifier isEqualToString:@"width"]) {
            obj.constant = 10;
            *stop = YES;
        }
    }];
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
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
