//
//  CoreGUIController.m
//  PuFree
//
//  Created by Mac OS X on 3/28/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import "CoreGUIController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"

@implementation CoreGUIController
-(id)initCoreGUIController:(UIWindow*)_window{
    self = [super init];
    window = _window;
    return self;
}
- (BOOL)connected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return !(networkStatus == NotReachable);
}
-(void)StartProgram{
    NSLog(@"Program Started");
    //Show Page Intro
    introView = [[IntroViewController alloc]initWithCoreGUI:self];
    [window addSubview:introView.view];
}
-(void)ShowListClass{
    if (![self connected])
    {
        // not connected
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Internet Connection Not Found" message:@"Please check your network settings!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    } else
    {
        // connected, do some internet stuff
        [self listClassFromJson];
        listClass = [[ListClassViewController alloc]initWithCoreGUI:self];
        navigation = [[UINavigationController alloc]initWithRootViewController:listClass];
        [window addSubview:navigation.view];
    }
    
    
}
-(void)PickClass:(NSString*)_codeClass{
    codeClass=_codeClass;
    pickDateView = [[PickDateViewController alloc]initWithCoreGUI:self codeClass:_codeClass];
    [navigation pushViewController:pickDateView animated:YES];
}
-(void)DatePicked:(int)_month year:(int)_year codeClass:(NSString*)_codeClass
{
    monthPicked = _month;
    yearPicked = _year;
    if (![self connected])
    {
        // not connected
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Internet Connection Not Found" message:@"Please check your network settings!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    } else
    {
        
        monthView = [[MonthViewController alloc]initWithCoreGUI:self codeClass:_codeClass month:monthPicked year:yearPicked];
        [navigation pushViewController:monthView animated:YES];
    }
}
-(void)listClassFromJson
{
   
    NSString *url = [NSString stringWithFormat:@"http://mobi.pufhcm.edu.vn/group_list.php"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfURL:
                        [NSURL URLWithString:url]];
    NSError *error;
    NSMutableDictionary *jsonIDclass = [NSJSONSerialization
                                        JSONObjectWithData:jsonData
                                        options:NSJSONReadingMutableContainers
                                        error:&error];
    if( error )
    {
        NSLog(@"%@", [error localizedDescription]);
    }
    else {
        idlistclass = jsonIDclass[@"idlistclass"];
        NSLog(@"JSON List Class loaded");
    }
}
-(NSString*)getIDClassFromJson:(NSString*)_codeClass
{
    NSString *idclass;
    for ( NSDictionary *IDclass in idlistclass )
    {
        //NSLog(@"----");
        //NSLog(@"ID: %@", IDclass[@"Id"] );
        //NSLog(@"Class: %@", IDclass[@"GroupName"] );
        //NSLog(@"----");
        if([_codeClass isEqualToString:IDclass[@"GroupName"]])
        {
            idclass = IDclass[@"Id"];
        }
    }
return idclass;
}
@end
