//
//  UITableView+Hide.m
//  CMHideTableSection
//
//  Created by 蔡明 on 16/4/27.
//  Copyright © 2016年 MrCai. All rights reserved.
//

#import "UITableView+Hide.h"
#import <objc/runtime.h>

static const char cmHideSectionKey;
static const char cmDefaultCellHeight;
@implementation UITableView (Hide)

/**
 *  获得属性高度
 *
 *  @return 返回高度
 */
- (CGFloat)cm_defaultCellHeight
{
    // 根据关联的key，获取关联的值。
    return [objc_getAssociatedObject(self, &cmDefaultCellHeight) floatValue];
}

/**
 *  设置属性高度
 */
- (void)setCm_defaultCellHeight:(CGFloat)cm_defaultCellHeight
{
    // 第一个参数：给哪个对象添加关联
    // 第二个参数：关联的key，通过这个key获取
    // 第三个参数：关联的value
    // 第四个参数:关联的策略
    objc_setAssociatedObject(self, &cmDefaultCellHeight, @(44), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

/**
 *
 *
 *  @return <#return value description#>
 */
- (NSMutableIndexSet *)cm_hideSections
{
    // 关联key,获取关联值
    NSMutableIndexSet *set =objc_getAssociatedObject(self, &cmHideSectionKey);
    if (set == nil) { // 为空
        set = [NSMutableIndexSet indexSet];
        // 设置属性值
        objc_setAssociatedObject(self, &cmHideSectionKey, set, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return set;
}

/**
 *  判断传入的section是否隐藏
 *
 *  @param section <#section description#>
 */
- (void)cm_hideSection:(NSInteger)section
{
    if ([self.cm_hideSections containsIndex:section]) {
        [self.cm_hideSections removeIndex:section];
        
    } else {
        [self.cm_hideSections addIndex:section];
        
        
    }
    [self reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

/**
 *  计算cell高度
 *
 *  @return 返回高度
 */
- (CGFloat)cm_configSectionHeightInSection:(NSInteger)section
{
    
    if ([self.cm_hideSections containsIndex:section]) {
        // cell高度为0
        return self.cm_defaultCellHeight;
    } else {
        return 0;
    }
}
@end
