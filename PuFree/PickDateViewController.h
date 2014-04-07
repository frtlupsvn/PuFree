//
//  PickDateViewController.h
//  PuFree
//
//  Created by Zoom on 4/4/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreGUIController;
@interface PickDateViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>{
    CoreGUIController * coreGUI;
    UIPickerView * pickerView;
    NSArray * arrayMonth;
    NSArray * arrayYear;
    NSArray * classGroup;
    NSDate * today;
    int _monthCurrent;
    int _yearCurrent;
    int _monthPicked;
    int _yearPicked;
    NSString *codeClass;
    NSString *codeClassGroup;
}
-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI codeClass:(NSString*)_codeClass;
@end
