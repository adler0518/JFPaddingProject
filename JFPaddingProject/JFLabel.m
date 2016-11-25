//
//  JFLabel.m
//  JFPaddingProject
//
//  Created by qitmac000260 on 16/11/25.
//  Copyright © 2016年 DJF. All rights reserved.
//

#import "JFLabel.h"

@implementation JFLabel

- (void)drawTextInRect:(CGRect)rect {
    NSLog(@"dddddd rect:%@", NSStringFromCGRect(rect));
    [super drawTextInRect:rect];
}

@end
