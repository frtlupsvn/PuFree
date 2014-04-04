//
//  AppDelegate.h
//  PuFree
//
//  Created by Mac OS X on 3/28/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreGUIController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    CoreGUIController * coreGUI;
}

@property (strong, nonatomic) UIWindow *window;

@end
