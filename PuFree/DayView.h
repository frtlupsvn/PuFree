//
//  DayView.h
//  PuFree
//
//  Created by Mac OS X on 4/1/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayView : UIView {
    UILabel *dayOfWeek;
}
-(id)initWithDayInfo:(int)_day dayOfWeek:(NSString*)_dayOfWeek;
@end
