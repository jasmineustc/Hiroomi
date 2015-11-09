//
//  Input Address.m
//  HiRoomi
//
//  Created by mizhang on 7/28/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "Input Address.h"
#import "PostInfo.h"


@implementation Input_Address
@synthesize addressInput;

-(void)viewDidLoad
{

    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor lightGrayColor]];
    _address_text.text = self.addressInput;
}

-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    titleView.textColor = [UIColor whiteColor];
    titleView.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView=titleView;
    titleView.text = title;
}

- (IBAction)exit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    addressInput = _address_text.text;
    [[self delegate]setAddressString:addressInput];    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
