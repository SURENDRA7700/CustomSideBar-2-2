//
//  SecondViewController.m
//  CustomSideBar
//
//  Created by Rakesh on 12/8/15.
//  Copyright (c) 2015 PTG. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize sideBarObj;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *showButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [showButton setTitle:@"ShowSideBar" forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(showSideBar:) forControlEvents:UIControlEventTouchUpInside];
    showButton.backgroundColor = [UIColor orangeColor];
    showButton.tag = 0;
    [self.view addSubview:showButton];
    
    [self.view addSubview:sideBarObj];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 60, 30)];
    [backButton setTitle:@"Back" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    backButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backButtonPressed:(UIButton *)Sendor
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)showSideBar:(UIButton *)Sendor
{
    if (Sendor.tag == 0)
    {
        sideBarObj.hidden = NO;
        CATransition *transition = [CATransition animation];
        transition.duration = 0.5;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        [sideBarObj.layer addAnimation:transition forKey:nil];
        [Sendor setTitle:@"HideSideBar" forState:UIControlStateNormal];
        Sendor.tag = 1;
    }
    else
    {
        sideBarObj.hidden = YES;
        CATransition *transition = [CATransition animation];
        transition.duration = 0.5;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        [sideBarObj.layer addAnimation:transition forKey:nil];
        [Sendor setTitle:@"ShowSideBar" forState:UIControlStateNormal];
        Sendor.tag = 0;
    }
}

@end
