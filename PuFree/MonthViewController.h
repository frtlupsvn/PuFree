//
//  MonthViewController.h
//  PuFree
//
//  Created by Mac OS X on 4/1/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayView.h"
#import "MyDayInfo.h"
@class CoreGUIController;
@interface MonthViewController : UIViewController <NSURLConnectionDelegate>
{
    CoreGUIController *coreGUI;
    NSString * codeClass;

    UIScrollView * scrollview;
    int y_scrollview_jump;

    DayView *dayView;
    
    int width;
    int height;
    
    NSDate *today;
    int _dayCurrent;
    int _monthCurrent;
    int _yearCurrent;
    int *_monthlengthCurrent;
    
    NSDate *dayPicked;
    int _monthPicked;
    int _yearPicked;
    int *_monthlengthPicked;
    
    NSMutableArray *arrayDayInfo;
    NSMutableArray *arrayDays;
    NSMutableArray *arrayDate;
    
    

}
-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI codeClass:(NSString*)_codeClass month:(int)_month year:(int)_year;
@end
