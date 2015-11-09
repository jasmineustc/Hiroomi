//
//  SelectState.m
//  HiRoomi
//
//  Created by mizhang on 7/23/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "SelectState.h"
#import "PostInfo.h"

@interface SelectState ()

@end

@implementation SelectState

@synthesize StateNameString,StatesNameNum;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title=@"Select State";
    _section1 = @[@"PA",@"CA"];
    StateNameString = _section1[_selected];
    StatesNameNum = _selected;
    [[self delegate]setUpStates:StateNameString];
    [[self delegate]setUpStatesNum:StatesNameNum];  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _section1.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"States" forIndexPath:indexPath];
    cell.textLabel.text=_section1[indexPath.row];
    if(indexPath.row==self.selected){
       cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        if (indexPath.row != self.selected) {
            NSIndexPath *oldIndexPath = [NSIndexPath indexPathForRow:self.selected inSection:0];
            UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:oldIndexPath];
            oldCell.accessoryType = UITableViewCellAccessoryNone;
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            self.selected = indexPath.row;
            StateNameString = _section1[_selected];
            StatesNameNum = _selected;
            
            [[self delegate]setUpStates:StateNameString];
            [[self delegate]setUpStatesNum:StatesNameNum];

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

-(void)Save:(id)sender
{
    
    [[self delegate]setUpStates:StateNameString];
    [[self delegate]setUpStatesNum:StatesNameNum];
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark - Navigation

 //In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
