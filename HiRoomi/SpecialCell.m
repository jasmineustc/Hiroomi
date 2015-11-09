//
//  SpecialCell.m
//  HiRoomi
//
//  Created by mizhang on 7/29/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "SpecialCell.h"

@implementation SpecialCell



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==3 && indexPath.row==1 && _hasChangeRoomPhoto){
        CGFloat height = 80.0;
        return height;
    }else{
        CGFloat height = 50.0;
        return height;
    }
}

-(void) layoutSubviews
{
    
    [super layoutSubviews];
    self.imageView.frame = CGRectMake( 302, 6, 65, 65 ); // your positioning here
    self.textLabel.frame = CGRectMake( 15, 15, 60, 20);
       
}


@end
