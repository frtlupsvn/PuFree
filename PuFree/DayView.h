//
//  DayView.h
//  PuFree
//
//  Created by Mac OS X on 4/1/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyDayInfo.h"
@interface DayView : UIView {
    UILabel *day;
    UILabel *dayOfWeek;
    
    UILabel *CourseNameAM;
    UILabel *TeacherAM;
    UILabel *RoomAM;
    UILabel *NoDayAM;
    
    UILabel *CourseNamePM;
    UILabel *TeacherPM;
    UILabel *RoomPM;
    UILabel *NoDayPM;
    
}
-(id)initWithDayInfo:(int)_day dayOfWeek:(NSString*)_dayOfWeek sunday:(BOOL)_sunday isToday:(BOOL)_today;
-(void)loadDayInfo:(MyDayInfo*)_DayInfo;
@property (nonatomic,retain) UILabel *day;
@property (nonatomic,retain) UILabel *dayOfWeek;
@end
