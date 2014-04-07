//
//  CoreGUIController.m
//  PuFree
//
//  Created by Mac OS X on 3/28/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import "CoreGUIController.h"

@implementation CoreGUIController
-(id)initCoreGUIController:(UIWindow*)_window{
    self = [super init];
    window = _window;
    return self;
}
-(void)StartProgram{
    NSLog(@"Program Started");
    //Show Page Intro
    introView = [[IntroViewController alloc]initWithCoreGUI:self];
    [window addSubview:introView.view];
}
-(void)ShowListClass{
    listClass = [[ListClassViewController alloc]initWithCoreGUI:self];
    navigation = [[UINavigationController alloc]initWithRootViewController:listClass];
    [window addSubview:navigation.view];
}
-(void)PickClass:(NSString*)_codeClass{
    codeClass=_codeClass;
    pickDateView = [[PickDateViewController alloc]initWithCoreGUI:self codeClass:_codeClass];
    [navigation pushViewController:pickDateView animated:YES];
}
-(void)DatePicked:(int)_month year:(int)_year codeClass:(NSString*)_codeClass
{
    monthPicked = _month;
    yearPicked = _year;
    monthView = [[MonthViewController alloc]initWithCoreGUI:self codeClass:_codeClass month:monthPicked year:yearPicked];
    [navigation pushViewController:monthView animated:YES];
}
@end
