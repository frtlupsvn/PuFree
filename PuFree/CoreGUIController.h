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
@interface CoreGUIController : NSObject{
    UIWindow *window;
    IntroViewController *introView;
    ListClassViewController *listClass;
    MonthViewController *monthView;
    UINavigationController *navigation;
    NSString* codeClass;
}
-(id)initCoreGUIController:(UIWindow*)_window;
-(void)StartProgram;
-(void)ShowListClass;
-(void)PickClass:(NSString*)_codeClass;
@end
