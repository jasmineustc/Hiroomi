//
//  RoomType.h
//  HiRoomi
//
//  Created by mizhang on 7/28/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol setUpRoomType <NSObject>

-(void)setRoomTypeNum:(NSUInteger)roomTypeNum;

@end




@interface RoomType : UITableViewController


@property (strong, nonatomic) NSArray *section1;
@property (nonatomic) NSUInteger roomTypeNum;
@property (nonatomic,assign) NSUInteger selected;

@property (retain) id<setUpRoomType> delegate;


@end
