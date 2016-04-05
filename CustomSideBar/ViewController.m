//
//  ViewController.m
//  CustomSideBar
//
//  Created by Rakesh on 12/1/15.
//  Copyright (c) 2015 PTG. All rights reserved.
//

#import "ViewController.h"
#import "SideBarMenu.h"
@interface ViewController ()
{
    UIButton *showButton;
}
@end

@implementation ViewController
@synthesize sideBarObj;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     showButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [showButton setTitle:@"ShowSideBar" forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(showSideBar:) forControlEvents:UIControlEventTouchUpInside];
    showButton.backgroundColor = [UIColor orangeColor];
    showButton.tag = 0;
    [self.view addSubview:showButton];
    
    UIButton *nextButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-80, 10, 60, 30)];
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    nextButton.backgroundColor = [UIColor blackColor];
    [self.view addSubview:nextButton];
    
    sideBarObj = [[SideBarMenu alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width/2, self.view.frame.size.height-50)];
    sideBarObj.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:sideBarObj];
    sideBarObj.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    showButton.tag = 0;
    [self.view addSubview:sideBarObj];
}

-(void)nextButtonPressed:(UIButton *)Sendor
{
    SecondViewController *secObj = [[SecondViewController alloc]init];
    secObj.sideBarObj = sideBarObj;
    [self presentViewController:secObj animated:YES completion:nil];
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
