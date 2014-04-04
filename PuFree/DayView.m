//
//  DayView.m
//  PuFree
//
//  Created by Mac OS X on 4/1/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import "DayView.h"

@implementation DayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithDayInfo:(int)_day dayOfWeek:(NSString*)_dayOfWeek sunday:(BOOL)_sunday
{
    self = [super init];
    self.frame = CGRectMake(0, 0,320, 100);
    self.backgroundColor = [UIColor whiteColor];
    UILabel *day = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 100, 50)];
    day.text = [NSString stringWithFormat:@"%d",_day];
    day.font = [UIFont systemFontOfSize:50.0];
    day.textAlignment = NSTextAlignmentCenter;
    dayOfWeek = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 100, 50)];
    dayOfWeek.text = _dayOfWeek;
    dayOfWeek.font = [UIFont systemFontOfSize:12.0];
    dayOfWeek.textAlignment = NSTextAlignmentCenter;
    
    UILabel *lineVerti = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 0.5, 100)];
    lineVerti.backgroundColor = [UIColor colorWithRed:(198/255.0) green:(198/255.0) blue:(202/255.0) alpha:1.0];
    
    UILabel *lineHorzi = [[UILabel alloc]initWithFrame:CGRectMake(100, 50, 220, 0.5)];
    lineHorzi.backgroundColor = [UIColor colorWithRed:(198/255.0) green:(198/255.0) blue:(202/255.0) alpha:1.0];
    
    [self addSubview:lineHorzi];
    [self addSubview:lineVerti];
    [self addSubview:day];
    [self addSubview:dayOfWeek];

    if (_sunday)
    {
        day.textColor = [UIColor redColor];
        dayOfWeek.textColor = [UIColor redColor];
    }
    //AM
    UILabel *CourseNameAM = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, 220, 25)];
    CourseNameAM.text = @"INF COMMUNICATION";
    CourseNameAM.font = [UIFont systemFontOfSize:15.0];
    CourseNameAM.textAlignment = NSTextAlignmentCenter;
    UILabel *TeacherAM = [[UILabel alloc]initWithFrame:CGRectMake(120, 30, 100, 25)];
    TeacherAM.text = @"Sido Marty";
    TeacherAM.font = [UIFont systemFontOfSize:12.0];
    UILabel *RoomAM = [[UILabel alloc]initWithFrame:CGRectMake(220, 30, 50, 25)];
    RoomAM.text = @"505 A";
    RoomAM.font = [UIFont systemFontOfSize:12.0];
    UILabel *NoDayAM = [[UILabel alloc]initWithFrame:CGRectMake(270, 30, 50, 25)];
    NoDayAM.text = @"6/10";
    NoDayAM.font = [UIFont systemFontOfSize:12.0];

    [self addSubview:CourseNameAM];
    [self addSubview:TeacherAM];
    [self addSubview:RoomAM];
    [self addSubview:NoDayAM];
    
    //PM
    
    UILabel *CourseNamePM = [[UILabel alloc]initWithFrame:CGRectMake(100, 55, 220, 25)];
    CourseNamePM.text = @"INF GES PROJ";
    CourseNamePM.font = [UIFont systemFontOfSize:15.0];
    CourseNamePM.textAlignment = NSTextAlignmentCenter;
    UILabel *TeacherPM = [[UILabel alloc]initWithFrame:CGRectMake(120, 80, 100, 25)];
    TeacherPM.text = @"NGUYEN Thi Kim Anh";
    TeacherPM.font = [UIFont systemFontOfSize:12.0];
    UILabel *RoomPM = [[UILabel alloc]initWithFrame:CGRectMake(220, 80, 50, 25)];
    RoomPM.text = @"505 A";
    RoomPM.font = [UIFont systemFontOfSize:12.0];
    UILabel *NoDayPM = [[UILabel alloc]initWithFrame:CGRectMake(270, 80, 50, 25)];
    NoDayPM.text = @"10/10";
    NoDayPM.font = [UIFont systemFontOfSize:12.0];
    
    [self addSubview:CourseNamePM];
    [self addSubview:TeacherPM];
    [self addSubview:RoomPM];
    [self addSubview:NoDayPM];

    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
