//
//  SelectCity.m
//  HiRoomi
//
//  Created by mizhang on 7/23/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "SelectCity.h"
#import "PostInfo.h"


@interface SelectCity ()

@end

@implementation SelectCity
@synthesize CityNum,CityNameString;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"Select City";
    _section1 = @[@"Aliquippa",@"Allentown",@"Aronld",@"Bethlehem",@"Pittsburgh",@"Philadelphia"];
    _section2= @[@"Adelanto",@"Agoura Hills",@"Los Angeles",@"Madera"];
    
    _cityarray = @[self.section1,self.section2];
    
    CityNum= _selected;
    CityNameString= _cityarray[_StatesNameUserSelected][_selected];
    
    [[self delegate]setUpCitysName:CityNameString];
    [[self delegate]setUpCitysNum:CityNum];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return _cityarray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_cityarray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    if(indexPath.section == _StatesNameUserSelected){
        cell.textLabel.text = _cityarray[indexPath.section][indexPath.row];
        if(indexPath.row==self.selected){
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        
    }else{
        cell.hidden=YES;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == _StatesNameUserSelected){
        CGFloat height = 50.0;
        return height;
    }else{
        CGFloat height = 0.0;
        return height;
    }   
}



- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == _StatesNameUserSelected){
        if (indexPath.row != CityNum) {
            NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:self.selected inSection:_StatesNameUserSelected];
            UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
            oldCell.accessoryType = UITableViewCellAccessoryNone;
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            self.selected = indexPath.row;
            CityNameString = _cityarray[_StatesNameUserSelected][_selected];
            CityNum= _selected;
        
            [[self delegate]setUpCitysName:CityNameString];
            [[self delegate]setUpCitysNum:CityNum];
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
