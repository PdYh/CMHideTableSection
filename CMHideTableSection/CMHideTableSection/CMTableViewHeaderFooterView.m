

//
//  CMTableViewHeaderFooterView.m
//  CMHideTableSection
//
//  Created by 蔡明 on 16/4/27.
//  Copyright © 2016年 MrCai. All rights reserved.
//

#import "CMTableViewHeaderFooterView.h"
#import "UITableView+Hide.h"
#import "Masonry.h"

@interface CMTableViewHeaderFooterView ()
@property (nonatomic ,weak) UIButton *tapButton;

@end
@implementation CMTableViewHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    UIButton *tapButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [tapButton addTarget:self action:@selector(tapSection:) forControlEvents:UIControlEventTouchUpInside];
    tapButton.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:tapButton];
    self.tapButton = tapButton;
    
    [self.tapButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];

}
//- (void)layoutSubviews
//{
//    [self.tapButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.contentView);
//    }];
//
//    [super layoutSubviews];
//
//}

#pragma mark - methods event
- (void)tapSection: (UIButton *)button
{
    UITableView *superView = (UITableView *)self.superview;
    // tableView调用,CMTableViewHeaderFooterView不是继承与tableView,包括其父类
    
    [superView cm_hideSection:self.hideSection];

}
@end
