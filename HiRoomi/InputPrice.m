//
//  InputPrice.m
//  HiRoomi
//
//  Created by mizhang on 7/29/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "InputPrice.h"
#import "PostInfo.h"



@implementation InputPrice
@synthesize RoomPrice;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}





- (IBAction)Save:(id)sender {
    RoomPrice = [_InputBox.text integerValue];
    [[self delegate]setUpRoomPrice:RoomPrice];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Canel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
