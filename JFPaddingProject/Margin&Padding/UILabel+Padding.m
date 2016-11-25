//
//  UILabel+Padding.m
//  JFPaddingProject
//
//  Created by qitmac000260 on 16/11/25.
//  Copyright © 2016年 DJF. All rights reserved.
//

#import "UILabel+Padding.h"
#import <objc/runtime.h>
#import "UIView+Margin.h"

const NSString* const kPaddingAssociatedCarrier = @"kPaddingAssociatedCarrier";

@implementation UILabel (Padding)

+(void)load {
    /** 获取原始drawTextInRect方法 */
    Method originalM = class_getInstanceMethod([self class], @selector(drawTextInRect:));
    
    /** 获取自定义的jf_setdrawTextInRect方法 */
    Method exchangeM = class_getInstanceMethod([self class], @selector(jf_drawTextInRect:));
    
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}

/** 自定义的方法 */
-(void)jf_drawTextInRect:(CGRect)rect {
    
    NSLog(@"%s",__FUNCTION__);
    
    /**
     1.更改padding
     2.所有继承自UIView的控件,拥有了margin和padding属性的设置
     3. 此时调用的方法 'jf_setdrawTextInRect' 相当于调用系统的 'drawTextInRect' 方法,原因是在load方法中进行了方法交换.
     4. 注意:此处并没有递归操作.
     */
    
//    NSLog(@"jjjjjjj rect:%@", NSStringFromCGRect(rect));
//    CGRect edge = UIEdgeInsetsInsetRect(rect, [self padding]);
//    NSLog(@"edge:%@", NSStringFromCGRect(edge));
    
    [self jf_drawTextInRect:UIEdgeInsetsInsetRect(rect, [self padding])];
}

-(void)setPadding:(UIEdgeInsets)padding {
    NSString *paddingStr = NSStringFromUIEdgeInsets(padding);
    objc_setAssociatedObject(self, &kPaddingAssociatedCarrier, paddingStr, OBJC_ASSOCIATION_COPY);
}
-(UIEdgeInsets)padding {
    NSString *paddingStr = objc_getAssociatedObject(self, &kPaddingAssociatedCarrier);
    NSLog(@"padding:%@", paddingStr);
    return UIEdgeInsetsFromString(paddingStr);
}


@end
