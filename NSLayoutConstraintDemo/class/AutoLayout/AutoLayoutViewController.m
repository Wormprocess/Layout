//
//  ViewController.m
//  NSLayoutConstraintDemo
//
//  Created by Tsunami on 2017/11/20.
//  Copyright © 2017年 Tsunami. All rights reserved.
//

#import "AutoLayoutViewController.h"
#import "AutoTableViewController.h"
#define kTop (self.navigationController.navigationBar.frame.size.height + [UIApplication sharedApplication].statusBarFrame.size.height)

@interface AutoLayoutViewController ()


@end

@implementation AutoLayoutViewController

- (void)setup1
{
    
    UIView * superview = [[UIView alloc]init];
    superview.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:superview];
    
    UIView * view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor cyanColor];
    [superview addSubview:view1];

    UIView * view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor magentaColor];
    [superview addSubview:view2];

    UIView * view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor cyanColor];
    [superview addSubview:view3];
    
    superview.translatesAutoresizingMaskIntoConstraints = NO;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    view3.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint * super_left = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    
    NSLayoutConstraint * super_top = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:kTop + 10];
    
    NSLayoutConstraint * super_right = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
    
    NSLayoutConstraint * super_height = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:80];
    
    [self.view addConstraints:@[super_left,super_top,super_right,super_height]];
    //H
   
    NSLayoutConstraint * view1_left = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
    
    NSLayoutConstraint * view2_left = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeRight multiplier:1 constant:10];
    
    
    NSLayoutConstraint * view3_left = [NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view2 attribute:NSLayoutAttributeRight multiplier:1 constant:10];
    
    NSLayoutConstraint * view3_right = [NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1 constant:-10];
    
    NSLayoutConstraint * width1 = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    NSLayoutConstraint * width2 = [NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    //V
    NSLayoutConstraint * view1_top = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1 constant:10];
    
    NSLayoutConstraint * view1_bottom = [NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
    
    NSLayoutConstraint * view2_top = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1 constant:10];
    
    NSLayoutConstraint * view3_top = [NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:1 constant:10];
    
    NSLayoutConstraint * height1 = [NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    
    NSLayoutConstraint * height2 = [NSLayoutConstraint constraintWithItem:view3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:view1 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    
    [superview addConstraints:@[view1_left,view2_left,view3_left,view3_right,width1,width2]];
    [superview addConstraints:@[view1_top,view1_bottom,view2_top,view3_top,height1,height2]];
    
}

- (void)setupVFL
{
    UIView * superview = [[UIView alloc]init];
    superview.backgroundColor = [UIColor redColor];
    [self.view addSubview:superview];
    
    UIView * view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor cyanColor];
    [superview addSubview:view1];
    
    UIView * view2 = [[UIView alloc]init];
    view2.backgroundColor = [UIColor magentaColor];
    [superview addSubview:view2];
    
    UIView * view3 = [[UIView alloc]init];
    view3.backgroundColor = [UIColor cyanColor];
    [superview addSubview:view3];
    
    superview.translatesAutoresizingMaskIntoConstraints = NO;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    view3.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSDictionary * metrics = @{@"space":@10};
    NSDictionary * views = NSDictionaryOfVariableBindings(superview,view1,view2,view3);
    NSString * sup_hvflstr = @"H:|-space-[superview]-space-|";
    NSArray * sup_hvfl = [NSLayoutConstraint constraintsWithVisualFormat:sup_hvflstr options:0 metrics:metrics views:views];
    NSString * sup_vvflstr = @"V:|-190-[superview(100)]";
    NSArray * sup_vvfl = [NSLayoutConstraint constraintsWithVisualFormat:sup_vvflstr options:0 metrics:metrics views:views];
    [self.view addConstraints:sup_hvfl];
    [self.view addConstraints:sup_vvfl];
    
    NSString * subhvflstr = @"H:|-space-[view1]-space-[view2(==view1)]-space-[view3(==view1)]-space-|";
    NSArray * sub_hvfl = [NSLayoutConstraint constraintsWithVisualFormat:subhvflstr options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:metrics views:views];
    NSString * subvvflstr1 = @"V:|-space-[view1]-space-|";
    
    NSArray * sub_vvfl1 = [NSLayoutConstraint constraintsWithVisualFormat:subvvflstr1 options:0 metrics:metrics views:views];
    [superview addConstraints:sub_hvfl];
    [superview addConstraints:sub_vvfl1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"NSLayoutConstraint";
    self.view.backgroundColor = [UIColor colorWithRed:122/255.0 green:207/255.0 blue:166/255.0 alpha:1];
    
    [self setup1];
    [self setupVFL];
    
    UIButton * btn = [[UIButton alloc]init];
    [btn setTitle:@"NEXT" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    NSString * btnH_VFL = @"H:[btn(100)]-10-|";
    NSString * btnV_VFL = @"V:[btn(40)]-100-|";
    NSDictionary * views = NSDictionaryOfVariableBindings(btn);
    NSArray * h_layout = [NSLayoutConstraint constraintsWithVisualFormat:btnH_VFL options:0 metrics:nil views:views];
    NSArray * v_layout = [NSLayoutConstraint constraintsWithVisualFormat:btnV_VFL options:0 metrics:nil views:views];
    
    [self.view addConstraints:h_layout];
    [self.view addConstraints:v_layout];
    
    //居中的方法,居中偏移还没有找到
    
#warning 水平反向约束时对齐方式options选top,bottom,cententY或为0，竖直方向反之
    
    UIButton * next = [UIButton buttonWithType:UIButtonTypeCustom];
    [next setTitle:@"next" forState:UIControlStateNormal];
    next.backgroundColor = [UIColor blueColor];
    [self.view addSubview:next];
    next.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(50, 30), YES, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [next setImage:image forState:UIControlStateNormal];
    
    NSString * h_vflstr = @"H:[next(100)][superView]";
    
    NSDictionary * views1 = @{@"next":next,@"superView":self.view};
    
    NSArray * h_vfl = [NSLayoutConstraint constraintsWithVisualFormat:h_vflstr options:NSLayoutFormatAlignAllCenterY metrics:nil views:views1];
    
    NSString * v_vflstr = @"V:[next(100)][superView]";
    
    NSArray * v_vfl = [NSLayoutConstraint constraintsWithVisualFormat:v_vflstr options:NSLayoutFormatAlignAllCenterX metrics:nil views:views1];
    
    [self.view addConstraints:h_vfl];
    [self.view addConstraints:v_vfl];
    

}

- (void)next
{
    AutoTableViewController * vc = [[AutoTableViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
