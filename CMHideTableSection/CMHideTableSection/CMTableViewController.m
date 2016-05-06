
//
//  CMTableViewController.m
//  CMHideTableSection
//
//  Created by 蔡明 on 16/4/27.
//  Copyright © 2016年 MrCai. All rights reserved.
//

#import "CMTableViewController.h"
#import "CMTableViewHeaderFooterView.h"
#import "UITableView+Hide.h"
@interface CMTableViewController ()
@property (nonatomic, assign) NSInteger sections;

@property (nonatomic, strong) NSMutableArray *titleArray;

@end

static NSString * const cellID = @"cellID";
static NSString * const headerID = @"headerID";

@implementation CMTableViewController
- (void)viewDidLoad
{
    [self.tableView registerClass:[CMTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UISwitch *sw = [[UISwitch alloc] init];
    UISwitch *sw1 = [[UISwitch alloc] init];
    self.tableView.tableHeaderView = sw;
    self.tableView.tableFooterView = sw1;
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.cm_defaultCellHeight = 44;
    _titleArray = [NSMutableArray arrayWithObjects: @"标题1",@"标题2",@"标题3",@"标题4",@"标题5", nil];

}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    self.sections = 5;
    return self.sections;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = _titleArray[indexPath.section];
    cell.textLabel.textAlignment = YES;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    cell.clipsToBounds = YES;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section        
{
    CMTableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerID];
    header.textLabel.text = _titleArray[section];
    header.hideSection = section;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cm_configSectionHeightInSection:indexPath.section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
@end
