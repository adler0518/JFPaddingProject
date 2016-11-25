//
//  UIView+Margin.m
//  JFPaddingProject
//
//  Created by qitmac000260 on 16/11/25.
//  Copyright © 2016年 DJF. All rights reserved.
//

#import "UIView+Margin.h"
#import <objc/runtime.h>

const NSString* const kMarginAssociatedCarrier = @"kMarginAssociatedCarrier";

@implementation UIView (Margin)

+(void)load {

    /** 获取原始方法 */
    Method originalM = class_getInstanceMethod([self class], @selector(addSubview:));

    /** 获取自定义的方法 */
    Method exchangeM = class_getInstanceMethod([self class], @selector(jf_addSubview:));

    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}

/** 自定义的方法 */
-(void)jf_addSubview:(UIView *)view {

    NSLog(@"%s",__FUNCTION__);

    /**
     1.更改margin
     2.所有继承自UIView的控件,拥有了margin和padding属性的设置
     3. 此时调用的方法 'jf_xxxxx' 相当于调用系统的 'xxxxx' 方法,原因是在load方法中进行了方法交换.
     4. 注意:此处并没有递归操作.
     */
    
//    NSLog(@"OLD frame:%@", NSStringFromCGRect(view.frame));
    UIEdgeInsets padding = [self margin];
    if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, padding) && view) {
        CGRect newRect = view.frame;
        newRect.origin.x = padding.left;
        newRect.origin.y = padding.top;
        
        if (self.clipsToBounds) {
            CGRect maxRect = UIEdgeInsetsInsetRect(self.frame, padding);
            if (newRect.size.width > maxRect.size.width) {
                newRect.size.width = maxRect.size.width;
            }
            if (newRect.size.height > maxRect.size.height) {
                newRect.size.height = maxRect.size.height;
            }
        }
        
        view.frame = newRect;
//        NSLog(@"new frame:%@", NSStringFromCGRect(view.frame));
    }
    
    [self jf_addSubview: view];
}


-(void)setMargin:(UIEdgeInsets)margin {
    NSString *marginStr = NSStringFromUIEdgeInsets(margin);
    objc_setAssociatedObject(self, &kMarginAssociatedCarrier, marginStr, OBJC_ASSOCIATION_COPY);
}
-(UIEdgeInsets)margin {
    NSString *marginStr = objc_getAssociatedObject(self, &kMarginAssociatedCarrier);
    NSLog(@"margin:%@", marginStr);
    return UIEdgeInsetsFromString(marginStr);
}

@end
