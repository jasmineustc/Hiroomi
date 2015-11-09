//
//  Input Address.h
//  HiRoomi
//
//  Created by mizhang on 7/28/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol setAddress <NSObject>

-(void)setAddressString:(NSString *)address;

@end


@interface Input_Address : UIViewController

- (IBAction)exit:(id)sender;

- (IBAction)save:(id)sender;

@property (nonatomic,strong) NSString *addressInput;

@property (weak, nonatomic) IBOutlet UITextField *address_text;

@property (retain) id<setAddress> delegate;

@end
