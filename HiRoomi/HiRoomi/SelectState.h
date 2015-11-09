//
//  SelectState.h
//  HiRoomi
//
//  Created by mizhang on 7/23/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SetUpStates <NSObject>

-(void)setUpStates:(NSString *)statesName;
-(void)setUpStatesNum:(NSUInteger) statesNum;


@end


@interface SelectState : UITableViewController

@property (strong, nonatomic) NSArray *section1;
@property (assign, nonatomic) NSUInteger selected;

@property (nonatomic, strong) NSString *StateNameString;
@property (nonatomic) NSUInteger StatesNameNum;
@property (retain) id<SetUpStates> delegate;


- (IBAction)Save:(id)sender;

@end

