//
//  InputPrice.h
//  HiRoomi
//
//  Created by mizhang on 7/29/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol setUpPrice <NSObject>

-(void)setUpRoomPrice:(NSInteger)roomprice;

@end


@interface InputPrice : UIViewController


@property (nonatomic) NSInteger RoomPrice;
@property (retain) id<setUpPrice> delegate;

- (IBAction)Save:(id)sender;
- (IBAction)Canel:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *InputBox;


@end
