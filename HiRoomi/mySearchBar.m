//
//  mySearchBar.m
//  HiRoomi
//
//  Created by mizhang on 8/3/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "mySearchBar.h"

@implementation mySearchBar



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"ahhhhhhhhhhhhh");
    [self setShowsCancelButton:YES animated:YES];
    
}


-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    NSLog(@"ahhhhhhhhhhhhh lalalla sss");
    [self setShowsCancelButton:YES animated:YES];
}

-(void)showSearch:(id)sender
{
    NSLog(@"ahhhhhhhhhhhhh aaa aaa ");
    
    
}


-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    
    NSLog(@"lalalalal ,code is running here!");
}



@end
