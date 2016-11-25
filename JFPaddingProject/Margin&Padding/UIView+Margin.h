//
//  UIView+Margin.h
//  JFPaddingProject
//
//  Created by jinfeng.du on 16/11/25.
//  Copyright © 2016年 DJF. All rights reserved.
//  margin 对UIView生效
//  padding暂不支持，定义在此为了其他控件扩展
//

#import <UIKit/UIKit.h>

//extern const NSString* const kMarginAssociatedCarrier;
//extern const NSString* const kPaddingAssociatedCarrier;

@interface UIView (Margin)

@property (nonatomic, assign) UIEdgeInsets margin;

@end


/*
 * 注意：
    margin的使用涉及到ClipsToBounds和addSubview方法，margin的设置需要再ClipsToBounds之后和addSubview之前。
 */
