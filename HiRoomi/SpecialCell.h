//
//  SpecialCell.h
//  HiRoomi
//
//  Created by mizhang on 7/29/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface SpecialCell : UITableViewCell


@property (nonatomic) BOOL hasChangeRoomPhoto;
@property (weak, nonatomic) IBOutlet UILabel *DetailText;


@property (weak, nonatomic) IBOutlet UIImageView *image;


@end
