//
//  ListClassViewController.h
//  PuFree
//
//  Created by Mac OS X on 3/29/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreGUIController;
@interface ListClassViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    CoreGUIController *coreGUI;
    UITableView *tableView;
    NSArray *listClassInfoArray;
    NSArray *listClassEcoArray;
}
-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI;
@end
