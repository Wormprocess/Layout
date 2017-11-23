//
//  ViewController.m
//  NSLayoutConstraintDemo
//
//  Created by Tsunami on 2017/11/20.
//  Copyright © 2017年 Tsunami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView * view1;
@property (nonatomic,strong) UIView * view2;
@property (nonatomic,strong) UIView * view3;
@property (nonatomic,strong) UIView * view4;

@property (nonatomic,strong) UILabel * text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:122/255.0 green:207/255.0 blue:166/255.0 alpha:1];
    
    self.view1 = [[UIView alloc]initWithFrame:CGRectZero];
    self.view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.view1];
    
    self.view2 = [[UIView alloc]initWithFrame:CGRectZero];
    self.view2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.view2];
    
    self.view3 = [[UIView alloc]initWithFrame:CGRectZero];
    self.view3.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.view3];
    
    self.view4 = [[UIView alloc]initWithFrame:CGRectZero];
    self.view4.backgroundColor = [UIColor blueColor];
    [self.view3 addSubview:self.view4];
    
    self.text = [[UILabel alloc]init];
    self.text.text = @"我是translatesAutoresizingMaskIntoConstraints";
    self.text.textColor = [UIColor redColor];
    [self.view3 addSubview:self.text];
    
    self.text.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.view1.translatesAutoresizingMaskIntoConstraints = NO;
    self.view2.translatesAutoresizingMaskIntoConstraints = NO;
    self.view3.translatesAutoresizingMaskIntoConstraints = NO;
    self.view4.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint * left_view1 = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    
    
    NSLayoutConstraint * top_view1 = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    
//    NSLayoutConstraint * height_view1 = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
//
//    NSLayoutConstraint * width_view1 = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300];
//
//    [self.view addConstraints:@[left_view1,top_view1,height_view1,width_view1]];
    
    NSLayoutConstraint * left_view2 = [NSLayoutConstraint constraintWithItem:self.view2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view1 attribute:NSLayoutAttributeRight multiplier:1 constant:20];
    

    
    NSLayoutConstraint * top_view2 = [NSLayoutConstraint constraintWithItem:self.view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view1 attribute:NSLayoutAttributeTop multiplier:1 constant:0];

    
    NSLayoutConstraint * right_view2 = [NSLayoutConstraint constraintWithItem:self.view2 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
    
    NSLayoutConstraint * width_view1AndView2 = [NSLayoutConstraint constraintWithItem:self.view2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view1 attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    NSLayoutConstraint * height_view1AndView2 = [NSLayoutConstraint constraintWithItem:self.view2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view1 attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    
    NSLayoutConstraint * heightAndwidth1 = [NSLayoutConstraint constraintWithItem:self.view1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:300];
    
//    [self.view1 addConstraints:@[heightAndwidth1]];
    
    [self.view addConstraints:@[left_view1,top_view1,top_view2,left_view2,right_view2,width_view1AndView2,height_view1AndView2,heightAndwidth1]];
    
    
    
    NSLayoutConstraint * left_view3 = [NSLayoutConstraint constraintWithItem:self.view3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    
    
    NSLayoutConstraint * top_view3 = [NSLayoutConstraint constraintWithItem:self.view3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view1 attribute:NSLayoutAttributeBottom multiplier:1 constant:20];
    
//    NSLayoutConstraint * width_view3 = [NSLayoutConstraint constraintWithItem:self.view3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
    

    
    NSLayoutConstraint * left_view4 = [NSLayoutConstraint constraintWithItem:self.view4 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
    
    
    NSLayoutConstraint * top_view4 = [NSLayoutConstraint constraintWithItem:self.view4 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    
    NSLayoutConstraint * width_view4 = [NSLayoutConstraint constraintWithItem:self.view4 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
    
    NSLayoutConstraint * height_view4 = [NSLayoutConstraint constraintWithItem:self.view4 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200];
    
    NSLayoutConstraint * bottom_view4 = [NSLayoutConstraint constraintWithItem:self.view4 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeBottom multiplier:1 constant:-20];
    
    NSLayoutConstraint * left_text = [NSLayoutConstraint constraintWithItem:self.text attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeLeft multiplier:1 constant:0];


    NSLayoutConstraint * top_text = [NSLayoutConstraint constraintWithItem:self.text attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeTop multiplier:1 constant:0];

//    NSLayoutConstraint * height_text = [NSLayoutConstraint constraintWithItem:self.text attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20];

    NSLayoutConstraint * right_text = [NSLayoutConstraint constraintWithItem:self.text attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view3 attribute:NSLayoutAttributeRight multiplier:1 constant:-20];

    [self.view3 addConstraints:@[left_text,top_text,right_text]];
    
    [self.view addConstraints:@[left_view3,top_view3]];
    [self.view3 addConstraints:@[left_view4,top_view4,width_view4,height_view4,bottom_view4]];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"%@---%@",NSStringFromCGRect(self.view1.frame),NSStringFromCGRect(self.view2.frame));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
