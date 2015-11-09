//
//  DatePickerTo.m
//  HiRoomi
//
//  Created by mizhang on 7/29/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "DatePickerTo.h"
#import "PostInfo.h"


@implementation DatePickerTo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (IBAction)save:(id)sender {
    NSDate *chosen= [self.DatePicker date];
    NSDateFormatter *formatterYear = [[NSDateFormatter alloc] init];
    [formatterYear setDateFormat:@"yyyy"];
    
    NSDateFormatter *formatterMonth = [[NSDateFormatter alloc] init];
    [formatterMonth setDateFormat:@"MM"];
    
    NSDateFormatter *formatterDay= [[NSDateFormatter alloc] init];
    [formatterDay setDateFormat:@"dd"];
    
    NSString *pass =[formatterYear stringFromDate:chosen];
    _yearSelect=[pass integerValue];
    
    pass =[formatterMonth stringFromDate:chosen];
    _monthSelect = [pass integerValue];
    
    pass = [formatterDay stringFromDate:chosen];
    _daySelect = [pass integerValue];

    [[self delegate]setToYear:_yearSelect];
    [[self delegate]setToMonth:_monthSelect];
    [[self delegate]setToDay:_daySelect];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end















