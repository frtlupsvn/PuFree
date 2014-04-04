//
//  PickDateViewController.m
//  PuFree
//
//  Created by Zoom on 4/4/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import "PickDateViewController.h"
#import "CoreGUIController.h"
@interface PickDateViewController ()

@end

@implementation PickDateViewController

-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI
{
    self =[super init];
    coreGUI = _coreGUI;
    self.title = @"Date";
    self.view.backgroundColor = [UIColor whiteColor];
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/5, self.view.frame.size.width, self.view.frame.size.height)];
    arrayMonth = [[NSArray alloc]initWithObjects:@"Month",@"January",@"February",@"March",@"April",@"May"
                  ,@"June",@"July",@"Auguest",@"September",@"October",@"November",@"December",  nil];
    arrayYear = [[NSArray alloc]initWithObjects:@"Year",@"2013",@"2014", nil];
    pickerView.delegate = self;
    [self.view addSubview:pickerView];
    UIBarButtonItem *TodayButton = [[UIBarButtonItem alloc] initWithTitle:@"Now" style:UIBarButtonItemStylePlain target:self action:@selector(PickerViewJumpToRow:)];
    self.navigationItem.rightBarButtonItem = TodayButton;
    [self getToday];
    // Add Button go to Calendar
    UIButton * showMonthView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    showMonthView.frame = CGRectMake(0, self.view.frame.size.height-100, self.view.frame.size.width, 50);
    [showMonthView setTitle:@"Show A Timme Table" forState:UIControlStateNormal];
    [self.view addSubview:showMonthView];
    [showMonthView addTarget:self action:@selector(ShowMonthViewButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
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
    _monthCurrent = [[arr2 objectAtIndex:1]intValue];
    _yearCurrent = [[arr2 objectAtIndex:0] intValue];
    
    //NSLog(@"Day: %d , Month : %d , Year : %d",_dayCurrent,_monthCurrent,_yearCurrent);
}

-(void)ShowMonthViewButtonPressed:(id)sender
{
    if (_monthPicked == 0 || _yearPicked == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Attention" message:@"Please pick a month and a year" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    else
    {
        NSLog(@"Show Time Table Pressed");
        [coreGUI DatePicked:_monthPicked year:_yearPicked];
    }
}
-(void)PickerViewJumpToRow:(id)sender
{
    [pickerView reloadAllComponents];
    [pickerView selectRow:_monthCurrent inComponent:0 animated:YES];
    _monthPicked = _monthCurrent;
    _yearPicked = _yearCurrent;
    if (_yearCurrent == 2013)
        [pickerView selectRow:1 inComponent:1 animated:YES];
    else
        [pickerView selectRow:2 inComponent:1 animated:YES];
    
    
    NSLog(@"%d %d",_monthPicked,_yearPicked);
}
//Picker Delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if( component == 0)
    {
    return [arrayMonth count];
    }
    else
    {
        return [arrayYear count];
    }

}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if( component == 0)
    {
    return [arrayMonth objectAtIndex:row];
    }
    else
    {
        return [arrayYear objectAtIndex:row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
    {
    //NSLog([NSString stringWithFormat:@"Month :%d",row]);
        _monthPicked = row;
    }
    else
    {
    //NSLog([NSString stringWithFormat:@"Year :%d",row]);
        if (row == 0) {
            _yearPicked = 0;
        } else {
            if(row == 1)
            {
                _yearPicked = 2013;
            }
            else
                {
                    if (row == 2)
                    {
                        _yearPicked = 2014;
                    }
        }
        }
    }
}
//
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
