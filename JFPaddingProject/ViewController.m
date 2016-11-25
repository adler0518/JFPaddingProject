//
//  ViewController.m
//  JFPaddingProject
//
//  Created by qitmac000260 on 16/11/25.
//  Copyright © 2016年 DJF. All rights reserved.
//

#import "ViewController.h"
//#import "UIView+Margin.h"
//#import "UILabel+Padding.h"
#import "MarginAndPaddingHeader.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *controlViews;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.controlViews = [[NSMutableArray alloc] init];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 40)];
    [bgView setBackgroundColor:[UIColor redColor]];
    [bgView setClipsToBounds:YES];
    [bgView setMargin:UIEdgeInsetsMake(5, 10, 5, 20)];
    [self.view addSubview:bgView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [label setText:@"自定义label"];
//    NSLog(@"frame:%@", NSStringFromCGRect(label.frame));
//    NSLog(@"bound:%@", NSStringFromCGRect(label.bounds));
    label.padding = UIEdgeInsetsMake(5, 30, 5, 10);
//    NSLog(@"01frame:%@", NSStringFromCGRect(label.frame));
//    NSLog(@"01bound:%@", NSStringFromCGRect(label.bounds));
//    label.bounds = CGRectInset(label.frame, 10, 10);
    [label setBackgroundColor:[UIColor yellowColor]];
    [bgView addSubview:label];
    
//    NSLog(@"1frame:%@", NSStringFromCGRect(label.frame));
//    NSLog(@"1bound:%@", NSStringFromCGRect(label.bounds));
    
//    CGFloat startY = 60;
//    [self.controlViews addObject:[self addViewWithClassName:@"UILabel" startY:&startY]];
    
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
//    [view setBackgroundColor:[UIColor yellowColor]];
////    [view setClipsToBounds:YES];
//    view.bounds = CGRectInset(view.frame, 10, 10);
////    view.padding = UIEdgeInsetsMake(5, 10, 5, 20);
//    [self.view addSubview:view];
//    
//    JFLabel *l1 = [[JFLabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
//    [l1 setBackgroundColor:[UIColor redColor]];
//    [l1 setText:@"ssssssss"];
//    [view addSubview:l1];
//    
//    NSLog(@"2frame:%@", NSStringFromCGRect(view.frame));
//    NSLog(@"2bound:%@", NSStringFromCGRect(view.bounds));
//    
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(260, 0, 20, 50)];
    [v2 setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:v2];
}

- (UIView*) addViewWithClassName:(NSString*)className startY:(CGFloat*) startY {
    CGFloat controlWidth = 100;
    CGFloat height = 50;
    CGFloat titleWidth = 100;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, *startY, titleWidth, height)];
    titleLabel.padding = UIEdgeInsetsMake(0, 10, 0, 10);
    [titleLabel setText:className];
    [titleLabel setBackgroundColor:[UIColor grayColor]];
    [titleLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:titleLabel];
    
    Class cls = NSClassFromString(className);
    UIView *cView = [[cls alloc] initWithFrame:CGRectMake(150, *startY, controlWidth, height)];
    [cView setBackgroundColor:[UIColor yellowColor]];
//    [cView setPadding:UIEdgeInsetsMake(10, 0, 10, 0)];
    [self.view addSubview:cView];
    
    *startY += height;
    return cView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
