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
    pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    arrayMonth = [[NSArray alloc]initWithObjects:@"January",@"February",@"March",@"April",@"May"
                  ,@"June",@"July",@"Auguest",@"September",@"October",@"November",@"December",  nil];
    arrayYear = [[NSArray alloc]initWithObjects:@"2013",@"2014", nil];
    pickerView.delegate = self;
    [self.view addSubview:pickerView];
    
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
