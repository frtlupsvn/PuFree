//
//  MyDayInfo.h
//  PuFree
//
//  Created by Mac OS X on 4/5/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDayInfo : NSObject
{
    NSString * RealCourseName;
    NSString * TeacherName;
    NSString * RoomName;
    BOOL Morning;
    int Noday;
    int TotalDays;
    int dateInfo;
    
}

@property (nonatomic,retain) NSString * RealCourseName;
@property (nonatomic,retain) NSString * TeacherName;
@property (nonatomic,retain) NSString * RoomName;
@property BOOL Morning;
@property int Noday;
@property int TotalDays;
@property int dateInfo;

@end
