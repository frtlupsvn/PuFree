//
//  DayView.m
//  PuFree
//
//  Created by Mac OS X on 4/1/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import "DayView.h"

@implementation DayView
@synthesize day,dayOfWeek;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithDayInfo:(int)_day dayOfWeek:(NSString*)_dayOfWeek sunday:(BOOL)_sunday isToday:(BOOL)_isToday{
    self = [super init];
    self.frame = CGRectMake(0, 0,320, 100);
    self.backgroundColor = [UIColor whiteColor];
    
    day = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 100, 50)];
    day.text = [NSString stringWithFormat:@"%d",_day];
    day.font = [UIFont systemFontOfSize:50.0];
    day.textAlignment = NSTextAlignmentCenter;
    
    dayOfWeek = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 100, 50)];
    dayOfWeek.text = _dayOfWeek;
    dayOfWeek.font = [UIFont systemFontOfSize:12.0];
    dayOfWeek.textAlignment = NSTextAlignmentCenter;

        day.textColor = [UIColor colorWithRed:(90/255.0) green:(90/255.0) blue:(90/255.0) alpha:1.0];
        dayOfWeek.textColor = [UIColor colorWithRed:(100/255.0) green:(100/255.0) blue:(100/255.0) alpha:1.0];

    
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
    if(_isToday){
        day.textColor = [UIColor blueColor];
        dayOfWeek.textColor = [UIColor blueColor];
    }
    //AM
    CourseNameAM = [[UILabel alloc]initWithFrame:CGRectMake(120, 3, 200, 25)];
    [CourseNameAM setFont:[UIFont fontWithName:@"HelveticaNeue" size:16.0]];
    //CourseNameAM.textAlignment = NSTextAlignmentCenter;
    TeacherAM = [[UILabel alloc]initWithFrame:CGRectMake(140, 25, 80, 25)];
    [TeacherAM setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    RoomAM = [[UILabel alloc]initWithFrame:CGRectMake(240, 25, 50, 25)];
    [RoomAM setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    NoDayAM = [[UILabel alloc]initWithFrame:CGRectMake(290, 25, 50, 25)];
    [NoDayAM setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    
    [self addSubview:CourseNameAM];
    [self addSubview:TeacherAM];
    [self addSubview:RoomAM];
    [self addSubview:NoDayAM];
    
    //PM
    
    CourseNamePM = [[UILabel alloc]initWithFrame:CGRectMake(120, 53, 200, 25)];
    [CourseNamePM setFont:[UIFont fontWithName:@"HelveticaNeue" size:16.0]];
    //CourseNamePM.textAlignment = NSTextAlignmentCenter;
    TeacherPM = [[UILabel alloc]initWithFrame:CGRectMake(140, 75, 80, 25)];
    [TeacherPM setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    RoomPM = [[UILabel alloc]initWithFrame:CGRectMake(240, 75, 50, 25)];
    [RoomPM setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    NoDayPM = [[UILabel alloc]initWithFrame:CGRectMake(290, 75, 50, 25)];
    [NoDayPM setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:10.0]];
    
    
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
        
        // Icon
        // UIImageView *teachericonAM = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"teacher.png"]];
        //teachericonAM.frame = CGRectMake(120, 25, 20, 20);
        //add Subview
        //[self addSubview:teachericonAM];
        
        UIImageView *roomiconAM = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"room.png"]];
        roomiconAM.frame = CGRectMake(225, 32, 10, 10);
        //add Subview
        [self addSubview:roomiconAM];
        
        //UIImageView *attentioniconAM = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"attention.png"]];
        //attentioniconAM.frame = CGRectMake(270, 25, 20, 20);
        //add Subview
        //[self addSubview:attentioniconAM];
    }
    else{
        // Add Day Info PM
        CourseNamePM.text = _DayInfo.RealCourseName;
        TeacherPM.text = _DayInfo.TeacherName;
        RoomPM.text = _DayInfo.RoomName;
        NoDayPM.text = [NSString stringWithFormat:@"%d/%d",_DayInfo.Noday,_DayInfo.TotalDays];
        
        // Icon
        //UIImageView *teachericonPM = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"teacher.png"]];
        //teachericonPM.frame = CGRectMake(120, 77, 20, 20);
        //add Subview
        //[self addSubview:teachericonPM];
        
        UIImageView *roomiconPM = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"room.png"]];
        roomiconPM.frame = CGRectMake(225, 80, 10, 10);
        //add Subview
        [self addSubview:roomiconPM];
        
        //UIImageView *attentioniconPM = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"attention.png"]];
        //attentioniconPM.frame = CGRectMake(270, 75, 20, 20);
        //add Subview
        //[self addSubview:attentioniconPM];
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
