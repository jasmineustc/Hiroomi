//
//  searchBarTableViewCell.m
//  HiRoomi
//
//  Created by mizhang on 8/2/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "searchBarTableViewCell.h"

@implementation searchBarTableViewCell


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 44;
    return height;

}

-(void) layoutSubviews
{
    self.searchBarItem.frame = CGRectMake(0, 0, 375, 44);
}

@end
