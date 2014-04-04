//
//  IntroViewController.h
//  PuFree
//
//  Created by Mac OS X on 3/28/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreGUIController;

@interface IntroViewController : UIViewController{
    CoreGUIController *coreGUI;
}
-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI;
@end
