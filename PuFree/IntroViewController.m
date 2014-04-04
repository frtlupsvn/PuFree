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
    //
    self.view.backgroundColor = [UIColor colorWithRed:(247/255.0) green:(247/255.0) blue:(247/255.0) alpha:1.0];
    UILabel *NameApp = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/8, self.view.frame.size.width, 60)];
    [NameApp setTextAlignment:NSTextAlignmentCenter];
    NameApp.textColor = [UIColor colorWithRed:(128/255.0) green:(128/255.0) blue:(128/255.0) alpha:1.0];
    [NameApp setText:@"Always Beside You"];
    [NameApp setFont:[UIFont systemFontOfSize:30]];
    [self.view addSubview:NameApp];
    
    UILabel *Slogan = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/8+40, self.view.frame.size.width, 30)];
    [Slogan setTextAlignment:NSTextAlignmentCenter];
    Slogan.textColor = [UIColor colorWithRed:(150/255.0) green:(150/255.0) blue:(150/255.0) alpha:1.0];
    [Slogan setText:@"Turn off your computer, and feel the beat"];
    [Slogan setFont:[UIFont systemFontOfSize:8]];
    [self.view addSubview:Slogan];
    
    UILabel *Version = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-40, self.view.frame.size.width, 30)];
    [Version setTextAlignment:NSTextAlignmentCenter];
    Version.textColor = [UIColor colorWithRed:(128/255.0) green:(128/255.0) blue:(128/255.0) alpha:1.0];
    [Version setText:@"Version 1.0"];
    [Version setFont:[UIFont systemFontOfSize:8]];
    [self.view addSubview:Version];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, 30)];
    [btn setTitle:@"List Class" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnpressed:) forControlEvents:UIControlEventTouchUpInside];
    //
    return self;
}
- (void)btnpressed:(id)sender{
    [coreGUI ShowListClass];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
