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

-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI codeClass:(NSString*)_codeClass
{
    self = [super init];
    coreGUI = _coreGUI;
    self.view.backgroundColor = [UIColor colorWithRed:(198/255.0) green:(198/255.0) blue:(202/255.0) alpha:1.0];
    self.title = [NSString stringWithFormat:@"%d-%d %@",_month,_year,_codeClass];
    UIBarButtonItem *TodayButton = [[UIBarButtonItem alloc] initWithTitle:@"Today" style:UIBarButtonItemStylePlain target:self action:@selector(todayJump:)];
    self.navigationItem.rightBarButtonItem = TodayButton;
    width = self.view.frame.size.width;
    height =self.view.frame.size.height;
    return self;
}
-(void)todayJump:(id)sender{
    NSLog(@"Today");
    [scrollview scrollRectToVisible:CGRectMake(0, y_scrollview_jump, scrollview.frame.size.width, scrollview.frame.size.height) animated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Scroll View
    scrollview = [[ UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:scrollview];
    //getToday
    [self getToday];
    [self daysOfMonth:today];
    [self loadDayView];
    self.title = [NSString stringWithFormat:@"%d-%d %@",_month,_year,codeClass];
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
    
}

- (void)oneFingerSwipeLeft:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe left
    NSLog(@"swipe left");
}

- (void)oneFingerSwipeRight:(UITapGestureRecognizer *)recognizer {
    // Insert your own code to handle swipe right
    NSLog(@"swipe right");
}

-(NSString*)dayOfWeek:(int)_day month:(int)_month year:(int)_year{
    //Day of week
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:_year];
    [components setMonth:_month];
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
    monthlength = days.length;
}
-(void)getToday{
    //get Date now
    today = [NSDate date];
    NSLog(@"now: %@",today);
    
    NSString * stringDate = [[NSString alloc]initWithFormat:@"%@",today];
    NSArray * arr1 = [stringDate componentsSeparatedByString:@" "];
    NSString * str = [arr1 objectAtIndex:0];
    NSLog(@"String Date : %@",str);
    
    NSArray * arr2 = [str componentsSeparatedByString:@"-"];
    _day = [[arr2 objectAtIndex:2] intValue];
    _month = [[arr2 objectAtIndex:1]intValue];
    _year = [[arr2 objectAtIndex:0] intValue];
    
    //NSLog(@"Day: %d , Month : %d , Year : %d",_day,_month,_year);
}
-(void)loadDayView{
    CGPoint  startpoint = CGPointMake(0, 0);
    for (int i =1;i<=monthlength;i++)
    {
        day = [[DayView alloc]initWithDayInfo:i dayOfWeek:[self dayOfWeek:i month:_month year:_year]];
        day.frame = CGRectMake(startpoint.x, startpoint.y,day.frame.size.width,day.frame.size.height);
        [scrollview addSubview:day];
        if (i==_day)
        {
            y_scrollview_jump = startpoint.y;
        }
        startpoint.y+=day.frame.size.height+0.5;
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
