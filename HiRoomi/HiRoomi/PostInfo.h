//
//  PostInfo.h
//  HiRoomi
//
//  Created by mizhang on 7/23/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectState.h"
#import "SelectCity.h"
#import "Input Address.h"
#import "RoomType.h"
#import "DatePicker.h"
#import "DatePickerTo.h"
#import "InputPrice.h"
#import "Title.h"

#import <Parse/Parse.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <ParseUI/ParseUI.h>
#import "SpecialCell.h"





@interface PostInfo : UITableViewController<SetUpStates,setUpCitys,setAddress,
                                            setUpRoomType,setFromTime,setToTime,setUpPrice,setUpRoomTitle,
                                            UIImagePickerControllerDelegate,UINavigationBarDelegate,CLLocationManagerDelegate>

@property (nonatomic,strong) NSString *StatesName;
@property (nonatomic,strong) NSString *CityName;
@property (nonatomic,strong) NSString *DistrictName;
@property (nonatomic,strong) NSString *Address;
@property (nonatomic,strong) NSString *Title;
@property (nonatomic,strong) NSString *roomDescription;


@property (nonatomic) BOOL hasChangeRoomType;
@property (nonatomic) BOOL hasChangeStatesName;
@property (nonatomic) BOOL hasChangeCitysName;
@property (nonatomic) BOOL hasChangeAddress;
@property (nonatomic) BOOL hasChangeFromDate;
@property (nonatomic) BOOL hasChangeToDate;
@property (nonatomic) BOOL hasChangePrice;
@property (nonatomic) BOOL hasSelectRoomPhotos;
@property (nonatomic) BOOL hasChangeRoomTitle;


@property (assign,nonatomic) NSUInteger StatesNum;
@property (nonatomic) NSUInteger CityNumber;
@property (nonatomic) NSUInteger DistrictNum;
@property (nonatomic) NSUInteger RoomTypeNum;
@property (nonatomic) NSString *AddressString;
@property (nonatomic) NSString *RoomTitle;
@property (nonatomic) float longitude;
@property (nonatomic) float latitude;

@property(nonatomic) NSInteger FromYear;
@property(nonatomic) NSInteger FromMonth;
@property(nonatomic) NSInteger FromDay;


@property(nonatomic) NSInteger ToYear;
@property(nonatomic) NSInteger ToMonth;
@property(nonatomic) NSInteger ToDay;

@property(nonatomic) NSInteger Price;

@property (weak, nonatomic) IBOutlet UIButton *AddressSegue;
@property (strong, nonatomic) IBOutlet UIButton *DatePickerSegue;



@property (nonatomic) UIView *overlayView;
@property (nonatomic) NSMutableArray *capturedImages;
@property (strong, nonatomic) UIImage *Bigimage;
@property (nonatomic) UIImagePickerController *myPhotoPicker;
@property  (nonatomic)  CLLocationManager *locationManage;


@property (weak, nonatomic) IBOutlet UILabel *PictDetail;
@property (weak, nonatomic) IBOutlet UIImageView *UserRoomPhoto;


- (IBAction)PublishRooms:(id)sender;

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType;

@end











