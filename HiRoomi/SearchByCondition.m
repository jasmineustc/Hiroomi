//
//  SearchByCondition.m
//  HiRoomi
//
//  Created by mizhang on 7/30/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "SearchByCondition.h"
#import "SearchMapViewController.h"


@implementation SearchByCondition
@synthesize section1,section2,section3,array;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Search";
//    section1 = @[@""];
    section1 = @[@"Nearby",@"Latest"];
//    section3 = @[@"Latest"];
    array = @[section1];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [array[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
    
    if(indexPath.section == 0){
//        identifier = @"searchBarViewCell";
        identifier = @"Condition";
    }else if(indexPath.section ==1){
        identifier = @"Condition";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    if(indexPath.section ==0){
        cell.textLabel.text=array[indexPath.section][indexPath.row];
    }else if(indexPath.section == 1){
        cell.textLabel.text=array[indexPath.section][indexPath.row];
    }else{
        
    
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        //has some problem to solve!!!!!
        UIViewController *searchMap = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchRoomNearby"];
        [self.navigationController pushViewController:searchMap animated:YES];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                       initWithTitle: @"Cancel"
                                       style: UIBarButtonItemStyleDone
                                       target: nil action: nil];
        [self.navigationItem setBackBarButtonItem:backButton];

    }else if(indexPath.section==1){
        if(indexPath.row == 0){
            SearchMapViewController *searchNearby = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchRoomNearby"];
            [self.navigationController pushViewController:searchNearby animated:YES];
        }
    }else{
    
    }

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        CGFloat height = 44;
        return height;
    }else if(indexPath.section==1){
        CGFloat height = 50;
        return  height;
    }else{
        CGFloat height = 100;
        return height;
    }

}


- (IBAction)exit:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"asdfasdfasdfasf");
    
    
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    NSLog(@"^^^^^^^^^^^^^^^^^^f");
    [self.mySearchBar resignFirstResponder];

}
@end





















