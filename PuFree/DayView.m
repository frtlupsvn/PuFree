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
-(id)initWithDayInfo:(int)_day dayOfWeek:(NSString*)_dayOfWeek sunday:(BOOL)_sunday{
    self = [super init];
    self.frame = CGRectMake(0, 0,320, 100);
    self.backgroundColor = [UIColor whiteColor];
    UILabel *day = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 100, 50)];
    day.text = [NSString stringWithFormat:@"%d",_day];
    day.font = [UIFont systemFontOfSize:50.0];
    day.textColor = [UIColor colorWithRed:(90/255.0) green:(90/255.0) blue:(90/255.0) alpha:1.0];
    day.textAlignment = NSTextAlignmentCenter;
    dayOfWeek = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 100, 50)];
    dayOfWeek.text = _dayOfWeek;
    dayOfWeek.textColor = [UIColor colorWithRed:(100/255.0) green:(100/255.0) blue:(100/255.0) alpha:1.0];
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
    CourseNameAM = [[UILabel alloc]initWithFrame:CGRectMake(120, 5, 220, 25)];
    CourseNameAM.font = [UIFont systemFontOfSize:15.0];
    //CourseNameAM.textAlignment = NSTextAlignmentCenter;
    TeacherAM = [[UILabel alloc]initWithFrame:CGRectMake(120, 30, 100, 25)];
    TeacherAM.font = [UIFont systemFontOfSize:12.0];
    RoomAM = [[UILabel alloc]initWithFrame:CGRectMake(220, 30, 50, 25)];
    RoomAM.font = [UIFont systemFontOfSize:12.0];
    NoDayAM = [[UILabel alloc]initWithFrame:CGRectMake(270, 30, 50, 25)];
    NoDayAM.font = [UIFont systemFontOfSize:12.0];
    
    //add Subview
    [self addSubview:CourseNameAM];
    [self addSubview:TeacherAM];
    [self addSubview:RoomAM];
    [self addSubview:NoDayAM];
    
    //PM
    
    CourseNamePM = [[UILabel alloc]initWithFrame:CGRectMake(120, 55, 220, 25)];
    CourseNamePM.font = [UIFont systemFontOfSize:15.0];
    //CourseNamePM.textAlignment = NSTextAlignmentCenter;
    TeacherPM = [[UILabel alloc]initWithFrame:CGRectMake(120, 80, 100, 25)];
    TeacherPM.font = [UIFont systemFontOfSize:12.0];
    RoomPM = [[UILabel alloc]initWithFrame:CGRectMake(220, 80, 50, 25)];
    RoomPM.font = [UIFont systemFontOfSize:12.0];
    NoDayPM = [[UILabel alloc]initWithFrame:CGRectMake(270, 80, 50, 25)];
    NoDayPM.font = [UIFont systemFontOfSize:12.0];
    
    
    //add Subview
    [self addSubview:CourseNamePM];
    [self addSubview:TeacherPM];
    [self addSubview:RoomPM];
    [self addSubview:NoDayPM];

    
    
    
    return self;
}
-(void)loadDayInfo:(MyDayInfo*)_DayInfo
{
    if(_DayInfo.Morning)
    {
        // Add Day Info AM
        CourseNameAM.text = _DayInfo.RealCourseName;
        TeacherAM.text = _DayInfo.TeacherName;
        RoomAM.text = _DayInfo.RoomName;
        NoDayAM.text = [NSString stringWithFormat:@"%d/%d",_DayInfo.Noday,_DayInfo.TotalDays];
    }
    else
    {
        // Add Day Info AM
        CourseNamePM.text = _DayInfo.RealCourseName;
        TeacherPM.text = _DayInfo.TeacherName;
        RoomPM.text = _DayInfo.RoomName;
        NoDayPM.text = [NSString stringWithFormat:@"%d/%d",_DayInfo.Noday,_DayInfo.TotalDays];
    }

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
