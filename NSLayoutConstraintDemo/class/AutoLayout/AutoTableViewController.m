//
//  AutoTableViewController.m
//  NSLayoutConstraintDemo
//
//  Created by dome on 2017/12/13.
//  Copyright © 2017年 Tsunami. All rights reserved.
//

#import "AutoTableViewController.h"
#import "LayoutHeightCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
@interface AutoTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation AutoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"FDTemplateLayoutCell";
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView * tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableview.delegate   = self;
    tableview.dataSource = self;
//    tableview.estimatedRowHeight = 100;
//    tableview.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:tableview];
    
    NSString * path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData * data = [NSData dataWithContentsOfFile:path];
    
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray <NSDictionary *>* feed  = dict[@"feed"];
    
    NSMutableArray * dataArray = @[].mutableCopy;
    
    [feed enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [dataArray addObject:[[LayoutCellModel alloc]initWithDictionary:obj]];
    }];
    [tableview registerClass:NSClassFromString(@"LayoutHeightCell") forCellReuseIdentifier:@"cell"];
    self.dataArray = dataArray;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LayoutHeightCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:@"cell" cacheByKey:[NSString stringWithFormat:@"indepath_row%ld",(long)indexPath.row] configuration:^(LayoutHeightCell * cell) {
        cell.model = self.dataArray[indexPath.row];
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
