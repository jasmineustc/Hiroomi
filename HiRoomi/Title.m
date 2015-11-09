//
//  Title.m
//  HiRoomi
//
//  Created by mizhang on 8/1/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "Title.h"
#import "PostInfo.h"



@implementation Title



-(void)viewDidLoad
{
    [super viewDidLoad];
    _roomTitle.text = _roomTitleString;
    _roomDescription.text =_roomDescriptionString;

}

-(void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    
}

- (IBAction)exit:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    
    _roomTitleString = _roomTitle.text;
    [[self delegate]setRoomTitle:_roomTitle.text];
    [[self delegate]setRoomDescription:_roomDescription.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
