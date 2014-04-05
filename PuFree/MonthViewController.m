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
    _monthPicked = _month;
    _yearPicked = _year;
    self.view.backgroundColor = [UIColor colorWithRed:(198/255.0) green:(198/255.0) blue:(202/255.0) alpha:1.0];
    self.title = [NSString stringWithFormat:@"%d-%d %@",_monthPicked,_yearPicked,_codeClass];
    UIBarButtonItem *TodayButton = [[UIBarButtonItem alloc] initWithTitle:@"Reload" style:UIBarButtonItemStylePlain target:self action:@selector(todayJump:)];
    self.navigationItem.rightBarButtonItem = TodayButton;
    width = self.view.frame.size.width;
    height =self.view.frame.size.height;
    return self;
}
-(void)todayJump:(id)sender{
    NSLog(@"Reload");
    //[scrollview scrollRectToVisible:CGRectMake(0, y_scrollview_jump, scrollview.frame.size.width, scrollview.frame.size.height) animated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //NSLog(@"%@",[NSString stringWithFormat:@"%d-%d",_monthPicked,_yearPicked]);
    // Scroll View
    scrollview = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollview];
    //getToday
    [self getToday];
    //
    [self getPickedDay];
    [self daysOfMonth:dayPicked];
    [self loadData];
    [self loadDayView];
    //self.title = [NSString stringWithFormat:@"%d-%d %@",_monthCurrent,_yearCurrent,codeClass];
    //NSLog([NSString stringWithFormat:@"Days length: %d",monthlength]);
    
    // Add swipeGestures
    UISwipeGestureRecognizer *oneFingerSwipeLeft = [[UISwipeGestureRecognizer alloc]
                                                     initWithTarget:self
                                                     action:@selector(oneFingerSwipeLeft:)];
    [oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:oneFingerSwipeLeft];
    
    UISwipeGestureRecognizer *oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]
                                                      initWithTarget:self
                                                      action:@selector(oneFingerSwipeRight:)] ;
    [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:oneFingerSwipeRight];
    // END swipeGestures
    
}

- (void)oneFingerSwipeLeft:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe left
    //NSLog(@"swipe left");
}

- (void)oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe right
    //NSLog(@"swipe right");
}

-(NSString*)dayOfWeek:(int)_day month:(int)_month year:(int)_year{
    //Day of week
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:_yearPicked];
    [components setMonth:_monthPicked];
    [components setDay:_day];
    //NSLog(@"Awesome time: %@", [calendar dateFromComponents:components]);
    
    NSDateFormatter* theDateFormatter = [[NSDateFormatter alloc] init];
    [theDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [theDateFormatter setDateFormat:@"EEEE"];
    NSString *weekDay =  [theDateFormatter stringFromDate:[calendar dateFromComponents:components]];
    //NSLog(weekDay);
    return weekDay;
}
-(void)daysOfMonth:(NSDate*)_date{
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSRange days = [gregorian rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:(_date)];
    _monthlengthPicked = days.length;
}
-(void)getToday{
    //get Date now
    today = [NSDate date];
    //NSLog(@"now: %@",today);
    
    NSString * stringDate = [[NSString alloc]initWithFormat:@"%@",today];
    NSArray * arr1 = [stringDate componentsSeparatedByString:@" "];
    NSString * str = [arr1 objectAtIndex:0];
    //NSLog(@"String Date : %@",str);
    
    NSArray * arr2 = [str componentsSeparatedByString:@"-"];
    _dayCurrent = [[arr2 objectAtIndex:2] intValue];
    _monthCurrent = [[arr2 objectAtIndex:1]intValue];
    _yearCurrent = [[arr2 objectAtIndex:0] intValue];
    
    //NSLog(@"Day: %d , Month : %d , Year : %d",_dayCurrent,_monthCurrent,_yearCurrent);
}
-(void)getPickedDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *componentsDate = [[NSDateComponents alloc] init];
    [componentsDate setYear:_yearPicked];
    [componentsDate setMonth:_monthPicked];
    [componentsDate setDay:15];
    //NSLog(@"Time Picked: %@", [calendar dateFromComponents:components]);
    dayPicked = [calendar dateFromComponents:componentsDate];
    //NSLog(@"Time Picked: %@",dayPicked);
    
}

-(void)loadData
{
//    arrayDayInfo = [[NSMutableArray alloc]init];
//    arrayDate   = [[NSMutableArray alloc]init];
//    MyDayInfo *dayInfo = [[MyDayInfo alloc]init];
//    dayInfo.RealCourseName = @"Toan";
//    dayInfo.TeacherName = @"Thanh";
//    dayInfo.RoomName =  @"515";
//    dayInfo.Morning = TRUE;
//    dayInfo.Noday = 5;
//    dayInfo.TotalDays = 10;
//    dayInfo.dateInfo = 5;
//    [arrayDayInfo addObject:dayInfo];
//    [arrayDate addObject:@(dayInfo.dateInfo)];
//    
//    dayInfo = [[MyDayInfo alloc]init];
//    dayInfo.RealCourseName = @"VAN";
//    dayInfo.TeacherName = @"NGA";
//    dayInfo.RoomName =  @"512";
//    dayInfo.Morning = FALSE;
//    dayInfo.Noday = 1;
//    dayInfo.TotalDays = 1;
//    dayInfo.dateInfo = 8;
//    [arrayDayInfo addObject:dayInfo];
//    [arrayDate addObject:@(dayInfo.dateInfo)];
//    
//    dayInfo = [[MyDayInfo alloc]init];
//    dayInfo.RealCourseName = @"SU";
//    dayInfo.TeacherName = @"NAM";
//    dayInfo.RoomName =  @"100";
//    dayInfo.Morning = FALSE;
//    dayInfo.Noday = 2;
//    dayInfo.TotalDays = 8;
//    dayInfo.dateInfo = 12;
//    [arrayDayInfo addObject:dayInfo];
//    [arrayDate addObject:@(dayInfo.dateInfo)];
//    
//    dayInfo = [[MyDayInfo alloc]init];
//    dayInfo.RealCourseName = @"SINH";
//    dayInfo.TeacherName = @"LAN";
//    dayInfo.RoomName =  @"91";
//    dayInfo.Morning = TRUE;
//    dayInfo.Noday = 3;
//    dayInfo.TotalDays = 7;
//    dayInfo.dateInfo = 30;
//    [arrayDayInfo addObject:dayInfo];
//    [arrayDate addObject:@(dayInfo.dateInfo)];
    
    arrayDayInfo = [[NSMutableArray alloc]init];
    NSData *jsonData = [[NSData alloc] initWithContentsOfURL:
                              [NSURL URLWithString:@"http://binhchonmytam.com/timetable/month.php?month=2&year=2013&idgroup=1f3aa243-a601-4015-978b-b4a3057ee45f"]];
    
    
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
        NSLog(@"%d",[data count]);
        NSArray *dataAM = [data objectAtIndex:0];
        NSArray *dataPM = [data objectAtIndex:1];
        NSLog(@"%d",[dataAM count]);
        NSLog(@"%d",[dataPM count]);
        
        for ( NSDictionary *dayInfo in dataPM )
        {
            NSLog(@"----");
            NSLog(@"RealCourseName: %@", dayInfo[@"RealCourseName"] );
            NSLog(@"TeacherName: %@", dayInfo[@"TeacherName"] );
            NSLog(@"RoomName: %@", dayInfo[@"RoomName"] );
            NSLog(@"Morning: %@", dayInfo[@"Morning"] );
            NSLog(@"NoDay: %@", dayInfo[@"NoDay"] );
            NSLog(@"TotalDays: %@", dayInfo[@"TotalDays"] );
            NSLog(@"----");
        }
    }
    NSLog(@"----");
    NSLog(@"month: %@", jsonDataDict[@"month"] );
    NSLog(@"year: %@", jsonDataDict[@"year"] );
    NSLog(@"IDGroup: %@", jsonDataDict[@"IDGroup"] );
    NSLog(@"----");
    NSLog(@"%d",[jsonDataDict count]);
}

-(void)loadDayView{
    CGPoint  startpoint = CGPointMake(0, 0);
    arrayDays = [[NSMutableArray alloc]init];
    for (int i =1;i<=_monthlengthPicked;i++)
    {
        dayView = [[DayView alloc]initWithDayInfo:i dayOfWeek:[self dayOfWeek:i month:_monthCurrent year:_yearCurrent] sunday:[[self dayOfWeek:i month:_monthCurrent year:_yearCurrent] isEqualToString:@"Sunday"]];
        dayView.frame = CGRectMake(startpoint.x, startpoint.y,dayView.frame.size.width,dayView.frame.size.height);
        [scrollview addSubview:dayView];
        if ([[self dayOfWeek:i month:_monthCurrent year:_yearCurrent] isEqualToString:@"Sunday"])
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
