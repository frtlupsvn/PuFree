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
-(id)initWithDayInfo:(int)_day dayOfWeek:(NSString*)_dayOfWeek
{
    self = [super init];
    self.backgroundColor = [UIColor whiteColor];
    self.frame = CGRectMake(0, 0,320, 100);
    UILabel *day = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    day.text = [NSString stringWithFormat:@"%d",_day];
    dayOfWeek = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, 100, 50)];
    dayOfWeek.text = _dayOfWeek;
    [self addSubview:day];
    [self addSubview:dayOfWeek];
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
