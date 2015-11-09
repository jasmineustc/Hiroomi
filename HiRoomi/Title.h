//
//  Title.h
//  HiRoomi
//
//  Created by mizhang on 8/1/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol setUpRoomTitle <NSObject>

-(void)setRoomTitle:(NSString *)roomTitle;
-(void)setRoomDescription:(NSString *)description;


@end


@interface Title : UIViewController

@property (nonatomic,strong) NSString *roomDescriptionString;
@property (nonatomic,strong) NSString *roomTitleString;
@property (retain) id<setUpRoomTitle> delegate;

@property (weak, nonatomic) IBOutlet UITextField *roomDescription;


@property (weak, nonatomic) IBOutlet UITextField *roomTitle;

- (IBAction)exit:(id)sender;

- (IBAction)save:(id)sender;

@end
