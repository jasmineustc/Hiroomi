//
//  SelectCity.h
//  HiRoomi
//
//  Created by mizhang on 7/23/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol setUpCitys <NSObject>

-(void)setUpCitysName:(NSString *)cityName;
-(void)setUpCitysNum:(NSUInteger) cityNum;

@end


@interface SelectCity : UITableViewController

@property (strong, nonatomic) NSArray *section1;
@property (strong, nonatomic) NSArray *section2;
@property (strong, nonatomic) NSArray *section3;
@property (strong, nonatomic) NSArray *section4;

@property (strong, nonatomic) NSArray *cityarray;
@property (assign, nonatomic) NSUInteger selected;

@property (nonatomic) NSUInteger StatesNameUserSelected;
@property (nonatomic,strong) NSString *CityNameString;
@property (nonatomic) NSUInteger CityNum;

@property (retain) id<setUpCitys> delegate;


@end
