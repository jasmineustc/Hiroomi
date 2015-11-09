//
//  DatePickerTo.h
//  HiRoomi
//
//  Created by mizhang on 7/29/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol setToTime <NSObject>

-(void)setToYear:(NSInteger) ToYear;
-(void)setToMonth:(NSInteger) ToMonth;
-(void)setToDay:(NSInteger) ToDay;

@end




@interface DatePickerTo : UIViewController


@property (nonatomic) NSInteger yearSelect;
@property (nonatomic) NSInteger monthSelect;
@property (nonatomic) NSInteger daySelect;
@property (retain) id<setToTime> delegate;

@property (weak, nonatomic) IBOutlet UIDatePicker *DatePicker;

- (IBAction)save:(id)sender;

- (IBAction)cancel:(id)sender;



@end
