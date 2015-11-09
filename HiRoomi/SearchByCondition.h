//
//  SearchByCondition.h
//  HiRoomi
//
//  Created by mizhang on 7/30/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchByCondition : UITableViewController<UISearchBarDelegate>

@property (strong, nonatomic) NSArray *section1;
@property (strong, nonatomic) NSArray *section2;
@property (strong, nonatomic) NSArray *section3;
@property (strong, nonatomic) NSArray *array;

@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;

- (IBAction)exit:(id)sender;


@end
