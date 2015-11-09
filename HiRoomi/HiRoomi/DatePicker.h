//
//  DatePicker.h
//  HiRoomi
//
//  Created by mizhang on 7/29/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol setFromTime <NSObject>

-(void)setFromYear:(NSInteger) year;
-(void)setFromMonth:(NSInteger) month;
-(void)setFromDay:(NSInteger) day;

@end



@interface DatePicker : UIViewController


@property (nonatomic) NSInteger yearSelect;
@property (nonatomic) NSInteger monthSelect;
@property (nonatomic) NSInteger daySelect;

@property (retain) id<setFromTime> delegate;

@property (weak, nonatomic) IBOutlet UIDatePicker *DataPickerControl;


- (IBAction)Cancel:(id)sender;

- (IBAction)save:(id)sender;

@end
