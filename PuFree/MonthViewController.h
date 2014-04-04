//
//  MonthViewController.h
//  PuFree
//
//  Created by Mac OS X on 4/1/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayView.h"
@class CoreGUIController;
@interface MonthViewController : UIViewController
{
    CoreGUIController *coreGUI;
    NSString * codeClass;

    UIScrollView * scrollview;
    int y_scrollview_jump;

    DayView *day;
    
    int width;
    int height;
    
    NSDate *today;
    int _day;
    int _month;
    int _year;
    int *monthlength;
}
-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI codeClass:(NSString*)_codeClass;
@end
