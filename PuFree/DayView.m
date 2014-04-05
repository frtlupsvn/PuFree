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
    CourseNameAM = [[UILabel alloc]initWithFrame:CGRectMake(120, 3, 200, 25)];
    [CourseNameAM setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:18.0]];
    //CourseNameAM.textAlignment = NSTextAlignmentCenter;
    TeacherAM = [[UILabel alloc]initWithFrame:CGRectMake(140, 25, 80, 25)];
    [TeacherAM setFont:[UIFont fontWithName:@"TrebuchetMS" size:12.0]];
    RoomAM = [[UILabel alloc]initWithFrame:CGRectMake(240, 25, 50, 25)];
    [RoomAM setFont:[UIFont fontWithName:@"TrebuchetMS" size:12.0]];
    NoDayAM = [[UILabel alloc]initWithFrame:CGRectMake(290, 25, 50, 25)];
    [NoDayAM setFont:[UIFont fontWithName:@"TrebuchetMS" size:12.0]];
    
    [self addSubview:CourseNameAM];
    [self addSubview:TeacherAM];
    [self addSubview:RoomAM];
    [self addSubview:NoDayAM];
    
    //PM
    
    CourseNamePM = [[UILabel alloc]initWithFrame:CGRectMake(120, 53, 200, 25)];
    [CourseNamePM setFont:[UIFont fontWithName:@"TrebuchetMS-Bold" size:20.0]];
    //CourseNamePM.textAlignment = NSTextAlignmentCenter;
    TeacherPM = [[UILabel alloc]initWithFrame:CGRectMake(140, 75, 80, 25)];
    [TeacherPM setFont:[UIFont fontWithName:@"TrebuchetMS" size:12.0]];
    RoomPM = [[UILabel alloc]initWithFrame:CGRectMake(240, 75, 50, 25)];
    [RoomPM setFont:[UIFont fontWithName:@"TrebuchetMS" size:12.0]];
    NoDayPM = [[UILabel alloc]initWithFrame:CGRectMake(290, 75, 50, 25)];
    [NoDayPM setFont:[UIFont fontWithName:@"TrebuchetMS" size:12.0]];
    
    
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
        UIImageView *teachericon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"teacher.png"]];
        teachericon.frame = CGRectMake(120, 25, 20, 20);
        //add Subview
        [self addSubview:teachericon];
        
        UIImageView *roomicon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"room.png"]];
        roomicon.frame = CGRectMake(220, 25, 20, 20);
        //add Subview
        [self addSubview:roomicon];
        
        UIImageView *attentionicon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"attention.png"]];
        attentionicon.frame = CGRectMake(270, 25, 20, 20);
        //add Subview
        //[self addSubview:attentionicon];


        
    }
    else
    {
        // Add Day Info AM
        CourseNamePM.text = _DayInfo.RealCourseName;
        TeacherPM.text = _DayInfo.TeacherName;
        RoomPM.text = _DayInfo.RoomName;
        NoDayPM.text = [NSString stringWithFormat:@"%d/%d",_DayInfo.Noday,_DayInfo.TotalDays];
        
        // Icon
        UIImageView *teachericon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"teacher.png"]];
        teachericon.frame = CGRectMake(120, 75, 20, 20);
        //add Subview
        [self addSubview:teachericon];
        
        UIImageView *roomicon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"room.png"]];
        roomicon.frame = CGRectMake(220, 75, 20, 20);
        //add Subview
        [self addSubview:roomicon];

        UIImageView *attentionicon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"attention.png"]];
        attentionicon.frame = CGRectMake(270, 75, 20, 20);
        //add Subview
        //[self addSubview:attentionicon];


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
