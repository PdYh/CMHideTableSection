//
//  UITableView+Hide.h
//  CMHideTableSection
//
//  Created by 蔡明 on 16/4/27.
//  Copyright © 2016年 MrCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Hide)
// 默认高度
@property (nonatomic, assign) CGFloat cm_defaultCellHeight;

// 隐藏某个section
- (void)cm_hideSection:(NSInteger)section;
// 隐藏section集合
- (NSMutableIndexSet *)cm_hideSections;
// cell高度,主要区别0和默认高度
- (CGFloat)cm_configSectionHeightInSection:(NSInteger)section;

@end
