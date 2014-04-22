//
//  MonthViewController.m
//  PuFree
//
//  Created by Mac OS X on 4/1/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//
#import "MonthViewController.h"
#import "CoreGUIController.h"
@interface MonthViewController ()

@end

@implementation MonthViewController

-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI codeClass:(NSString*)_codeClass month:(int)_month year:(int)_year
{
    self = [super init];
    coreGUI = _coreGUI;
    codeClass = _codeClass;
    _monthPicked = _month;
    _yearPicked = _year;
    self.view.backgroundColor = [UIColor colorWithRed:(198/255.0) green:(198/255.0) blue:(202/255.0) alpha:1.0];
    self.title = [NSString stringWithFormat:@"%d-%d %@",_monthPicked,_yearPicked,_codeClass];
    [self getToday];
    if(_month==_monthCurrent && _year==_yearCurrent)
    {
    UIBarButtonItem *TodayButton = [[UIBarButtonItem alloc] initWithTitle:@"Today" style:UIBarButtonItemStylePlain target:self action:@selector(todayJump:)];
    self.navigationItem.rightBarButtonItem = TodayButton;
    }
    width = self.view.frame.size.width;
    height =self.view.frame.size.height;
    
    return self;
}
-(void)todayJump:(id)sender{
    NSLog(@"Jump to today :%d",_dayCurrent);
    [scrollview scrollRectToVisible:CGRectMake(0, ((_dayCurrent-2)*dayView.frame.size.height), scrollview.frame.size.width, scrollview.frame.size.height) animated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Scroll View
    scrollview = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollview];
    //getToday
    
    [self getPickedDay];
    [self daysOfMonth:dayPicked];
    [self loadData];
    [self loadDayView];
    
}


-(NSString*)dayOfWeek:(int)_day{
    //Day of week
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:_yearPicked];
    [components setMonth:_monthPicked];
    [components setDay:_day];
    
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"EEEE"];
    NSString *weekDay =  [theDateFormatter stringFromDate:[calendar dateFromComponents:components]];
    return weekDay;
}
-(BOOL)isToday:(int)_day {
    [self getToday];
    if(_day ==  _dayCurrent && _monthPicked == _monthCurrent && _yearPicked == _yearCurrent )
    {
        return true;
        
    }
    else
    {
        return false;
    }
}

-(BOOL)isSunday:(int)_day{
    //Day of week
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:_yearPicked];
    [components setMonth:_monthPicked];
    [components setDay:_day];
    
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"e"];
    NSString *weekDay =  [theDateFormatter stringFromDate:[calendar dateFromComponents:components]];
    if([weekDay isEqualToString:@"1"]){
    return true;
    } else
    {
    return false;
    }
}

-(void)daysOfMonth:(NSDate*)_date{
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSRange days = [gregorian rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:(_date)];
    _monthlengthPicked = days.length;
}
-(void)getToday{
    //get Date now
    today = [NSDate date];
    
    NSString * stringDate = [[NSString alloc]initWithFormat:@"%@",today];
    NSArray * arr1 = [stringDate componentsSeparatedByString:@" "];
    NSString * str = [arr1 objectAtIndex:0];
    
    NSArray * arr2 = [str componentsSeparatedByString:@"-"];
    _dayCurrent = [[arr2 objectAtIndex:2] intValue];
    _monthCurrent = [[arr2 objectAtIndex:1]intValue];
    _yearCurrent = [[arr2 objectAtIndex:0] intValue];
    
}
-(int)getDate:(NSString*)_stringDate
{
    NSArray * arr1 = [_stringDate componentsSeparatedByString:@" "];
    NSString * str = [arr1 objectAtIndex:0];
    NSArray * arr2 = [str componentsSeparatedByString:@"-"];
    return [[arr2 objectAtIndex:2] intValue];
}
-(void)getPickedDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *componentsDate = [[NSDateComponents alloc] init];
    [componentsDate setYear:_yearPicked];
    [componentsDate setMonth:_monthPicked];
    [componentsDate setDay:15];
    dayPicked = [calendar dateFromComponents:componentsDate];
    
}
-(void)loadData
{
    arrayDayInfo = [[NSMutableArray alloc]init];
    arrayDate   = [[NSMutableArray alloc]init];
    MyDayInfo *dayInfoModel = [[MyDayInfo alloc]init];
    NSString *url = [NSString stringWithFormat:@"http://mobi.pufhcm.edu.vn/month.php?month=%d&year=%d&idgroup=%@",_monthPicked,_yearPicked,[coreGUI getIDClassFromJson:codeClass]];
    NSData *jsonData = [[NSData alloc] initWithContentsOfURL:
                              [NSURL URLWithString:url]];
    
    
    NSError *error;
    NSMutableDictionary *jsonDataDict = [NSJSONSerialization
                                       JSONObjectWithData:jsonData
                                       options:NSJSONReadingMutableContainers
                                       error:&error];
    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        NSArray *data = jsonDataDict[@"data"];
        for ( NSDictionary *dayInfo in data )
        {
                dayInfoModel = [[MyDayInfo alloc]init];
                dayInfoModel.RealCourseName = dayInfo[@"RealCourseName"];
                dayInfoModel.TeacherName = dayInfo[@"TeacherName"];
                dayInfoModel.RoomName =  dayInfo[@"RoomName"];
                dayInfoModel.Morning = (BOOL)[dayInfo[@"Morning"] intValue];
                dayInfoModel.dateInfo = [self getDate:dayInfo[@"InDate"]];
                dayInfoModel.Noday = [dayInfo[@"NoDay"] intValue];
                dayInfoModel.TotalDays = [dayInfo[@"TotalDays"] intValue];
                [arrayDayInfo addObject:dayInfoModel];
                [arrayDate addObject:@(dayInfoModel.dateInfo)];
        }
    }
    NSLog(@"----");
    NSLog(@"month: %@", jsonDataDict[@"month"] );
    NSLog(@"year: %@", jsonDataDict[@"year"] );
    NSLog(@"IDGroup: %@", jsonDataDict[@"IDGroup"] );
    NSLog(@"----");

}
-(void)loadDayView{
    CGPoint  startpoint = CGPointMake(0, 0);
    arrayDays = [[NSMutableArray alloc]init];
    for (int i =1;i<=_monthlengthPicked;i++)
    {
        dayView = [[DayView alloc]initWithDayInfo:i dayOfWeek:[self dayOfWeek:i] sunday:[self isSunday:i] isToday:[self isToday:i]];
        dayView.frame = CGRectMake(startpoint.x, startpoint.y,dayView.frame.size.width,dayView.frame.size.height);
        [scrollview addSubview:dayView];
        
        if ([self isSunday:i])
        {
            startpoint.y+=dayView.frame.size.height+20;
        }
        else
        {
        startpoint.y+=dayView.frame.size.height+0.5;
        }
        for (int z=0;z<[arrayDate count];z++)
        {
            if ( i == [[arrayDate objectAtIndex:z] intValue])
            {
                [dayView loadDayInfo:[arrayDayInfo objectAtIndex:z]];
            }
        }
    }
    scrollview.contentSize = CGSizeMake(self.view.frame.size.width, startpoint.y);
}
- (void)viewDidAppear:(BOOL)animated{
    scrollview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
