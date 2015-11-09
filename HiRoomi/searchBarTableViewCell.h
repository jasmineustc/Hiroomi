//
//  searchBarTableViewCell.h
//  HiRoomi
//
//  Created by mizhang on 8/2/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mySearchBar.h"


@interface searchBarTableViewCell : UITableViewCell<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBarItem;



@end
