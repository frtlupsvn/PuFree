//
//  CoreGUIController.h
//  PuFree
//
//  Created by Mac OS X on 3/28/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IntroViewController.h"
#import "ListClassViewController.h"
#import "MonthViewController.h"
#import "PickDateViewController.h"
@interface CoreGUIController : NSObject{
    UIWindow *window;
    IntroViewController *introView;
    ListClassViewController *listClass;
    MonthViewController *monthView;
    PickDateViewController *pickDateView;
    UINavigationController *navigation;
    NSString* codeClass;
    NSArray *idlistclass;
    int  monthPicked;
    int  yearPicked;
}
-(id)initCoreGUIController:(UIWindow*)_window;
-(void)StartProgram;
-(void)ShowListClass;
-(void)PickClass:(NSString*)_codeClass;
-(void)DatePicked:(int)_month year:(int)_year codeClass:(NSString*)_codeClass;
-(void)listClassFromJson;
-(NSString*)getIDClassFromJson:(NSString*)_codeClass;
@end
