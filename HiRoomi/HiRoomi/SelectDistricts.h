//
//  SelectDistricts.h
//  HiRoomi
//
//  Created by mizhang on 7/24/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol setUpDistrict <NSObject>

-(void)setUpDistrictName:(NSString *)DistrictNameString;
-(void)setUpDistrictNum: (NSUInteger) DistrictNumber;

@end


@interface SelectDistricts : UITableViewController


@property (strong, nonatomic) NSArray *section1;
@property (strong, nonatomic) NSArray *section2;
@property (strong, nonatomic) NSArray *section3;
@property (strong, nonatomic) NSArray *section4;

@property (strong, nonatomic) NSArray *Districtarray;
@property (assign, nonatomic) NSUInteger selected;



@end
