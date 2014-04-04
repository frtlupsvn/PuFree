//
//  ListClassViewController.m
//  PuFree
//
//  Created by Mac OS X on 3/29/14.
//  Copyright (c) 2014 Zoom. All rights reserved.
//

#import "ListClassViewController.h"
#import "CoreGUIController.h"
@interface ListClassViewController ()

@end

@implementation ListClassViewController


-(id)initWithCoreGUI:(CoreGUIController*)_coreGUI{
    self= [super init];
    coreGUI = _coreGUI;
    self.title =@"Pôles Universitaires Français HCM";
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"List Class Showed");
    
    //Add Data to Array
    listClassInfoArray = [NSArray arrayWithObjects:@"LINF11",@"LINF12",@"LINF13",nil];
    listClassEcoArray = [NSArray arrayWithObjects:@"LEGF11",@"LEGF12",@"LEGF13",nil];
    
    //Table View List Class
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    //
    
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)viewDidAppear:(BOOL)animated{
}
//TableView Delegate
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0)
        return @"Informatique";
    else
        return @"Gestion Economie";
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return listClassInfoArray.count;
    else
        return listClassEcoArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [listClassInfoArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"it_logo.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = @"Licence Informatique";
    }
    else
    {
        cell.textLabel.text = [listClassEcoArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"eco_logo.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = @"Licence Economique";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *contentRow = cell.textLabel.text;
    //NSInteger numeroRow = indexPath.row;
    [coreGUI PickClass:contentRow];
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
