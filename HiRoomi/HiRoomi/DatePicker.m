//
//  DatePicker.m
//  HiRoomi
//
//  Created by mizhang on 7/29/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "DatePicker.h"
#import "PostInfo.h"


@implementation DatePicker


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (IBAction)Cancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)save:(id)sender {
    
    NSDate *chosen= [self.DataPickerControl date];
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
    
    [[self delegate]setFromYear:_yearSelect];
    [[self delegate]setFromMonth:_monthSelect];
    [[self delegate]setFromDay:_daySelect];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end













