//
//  IntroViewController.m
//  PuFree
//
//  Created by Mac OS X on 3/28/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import "IntroViewController.h"
#import "CoreGUIController.h"
@interface IntroViewController ()

@end

@implementation IntroViewController

-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI{
    self = [super init];
    coreGUI = _coreGUI;
    self.view.backgroundColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1.0];
    return self;
}
- (void)btnpressed:(id)sender{
    [coreGUI ShowListClass];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //UIImageView *logohusat = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo2.png"]];
    //logohusat.frame = CGRectMake(0,self.view.frame.size.height/4, self.view.frame.size.width, 160);
    //[self.view addSubview:logohusat] ;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, self.view.frame.size.height/4, self.view.frame.size.width, 160)];
    [btn setBackgroundImage:[UIImage imageNamed:@"logo2.png"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnpressed:) forControlEvents:UIControlEventTouchUpInside];

    UILabel *Version = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 30)];
    [Version setTextAlignment:NSTextAlignmentCenter];
    Version.textColor = [UIColor colorWithRed:(236/255.0) green:(240/255.0) blue:(241/255.0) alpha:1.0];
    [Version setText:@"PUF HoChiMinh-City - version 1.0"];
    //Version.textColor = [UIColor blackColor];
    [Version setFont:[UIFont systemFontOfSize:12.0]];
    [self.view addSubview:Version];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
