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
    listClassEcoFrArray = [NSArray arrayWithObjects:@"LEG11F",@"LEG12F",@"LEG13F",nil];
    listClassEcoEnArray = [NSArray arrayWithObjects:@"LEG11A",@"LEG12A",@"LEG13A",nil];
    //listClassMasterArray = [NSArray arrayWithObjects:@"LEG11A",@"LEG12A",@"LEG13A",nil];
    
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
        return @"Licence Informatique";
    else if(section==1)
        return @"Licence Gestion Economie Français";
    else
        return @"Licence Gestion Economie Anglais";
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return listClassInfoArray.count;
    else if(section==1)
        return listClassEcoFrArray.count;
    else
        return listClassEcoEnArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [listClassInfoArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"it_logo.png"];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = @"Licence Informatique";
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.0];
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = [listClassEcoFrArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"eco_logo.png"];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
        cell.imageView.image = [UIImage imageNamed:@"eco_logofr.png"];
        cell.textLabel.font = [UIFont fontWithName:@"TrebuchetMS" size:18.0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = @"Licence Economique Français";
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.0];

    }
    else
        {
        cell.textLabel.text = [listClassEcoEnArray objectAtIndex:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"eco_logo.png"];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18.0];
        cell.imageView.image = [UIImage imageNamed:@"eco_logoen.png"];
        cell.textLabel.font = [UIFont fontWithName:@"TrebuchetMS" size:18.0];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.text = @"Licence Economique Anglais";
            cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:10.0];

            
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
