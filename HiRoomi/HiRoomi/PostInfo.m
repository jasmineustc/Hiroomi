//
//  PostInfo.m
//  HiRoomi
//
//  Created by mizhang on 7/23/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "PostInfo.h"
#include <sys/sysctl.h>
#include <sys/utsname.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <CoreMotion/CoreMotion.h>
#import <Foundation/Foundation.h>


@interface PostInfo ()
@property (strong, nonatomic) NSArray *section1;
@property (strong, nonatomic) NSArray *section2;
@property (strong, nonatomic) NSArray *section3;
@property (strong, nonatomic) NSArray *section4;
@property (strong, nonatomic) NSArray *section5;
@property (strong, nonatomic) NSArray *array;
@property (nonatomic) CLGeocoder *geocoder;

@property (assign, nonatomic) NSUInteger selected;

@end

@implementation PostInfo

@synthesize StatesName,CityName,DistrictName,StatesNum,CityNumber,
            DistrictNum,RoomTypeNum,geocoder,longitude,latitude,locationManage;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    locationManage = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc]init];
    
    [self.locationManage requestAlwaysAuthorization];
    [self.locationManage requestWhenInUseAuthorization];
    _section1 = @[@"State",@"City", @"Address"];
    _section2 = @[@"Room Type",@"Title"];
    _section3 = @[@"FromTime", @"EndTime"];
    _section4 = @[@"Price $/M",@"Photos"];
    _array = @[_section1, _section2, _section3,_section4];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    geocoder = [[CLGeocoder alloc]init];
    
    locationManage = [[CLLocationManager alloc] init];
    [self.locationManage requestAlwaysAuthorization];
    [self.locationManage requestWhenInUseAuthorization];
    [self.tableView reloadData];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *Identifier;
    if(indexPath.section == 3 && indexPath.row==1){
        Identifier = @"SpecialCell";
    }else{ 
        Identifier = @"StateCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier forIndexPath:indexPath];
    if([Identifier isEqualToString:@"StateCell"]){
        cell.textLabel.text = _array[indexPath.section][indexPath.row];
    }else{
        cell = (SpecialCell *)cell;
        cell.textLabel.text = _array[indexPath.section][indexPath.row];
    }
    
        if (indexPath.section == 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (indexPath.row == 0) {
                if(_hasChangeStatesName == YES){
                    cell.detailTextLabel.text = StatesName;
                    
                }else{
                    cell.detailTextLabel.text = @"Choose State";
                }
            }else if(indexPath.row==1){
                if(_hasChangeStatesName!=YES){
                    cell.detailTextLabel.text = @"Choose City";
                }else{
                    if(_hasChangeCitysName == YES){
                        cell.detailTextLabel.text = CityName;
                    }else{
                        cell.detailTextLabel.text = @"Choose City";
                        _hasChangeCitysName = YES;
                    }
                }
            }else{
                if(_hasChangeAddress!=YES){
                    cell.detailTextLabel.text = @"Input Address";
                }else{
                    cell.detailTextLabel.text = _AddressString;
                    geocoder = [[CLGeocoder alloc]init];
                    [self getCoordinateByAddress:_AddressString];
                    if(latitude == 0 || longitude==0){
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!"
                                                                       message:@"You have input the wrong address"
                                                                      delegate:self
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles:nil, nil];
                        [alert show];
                        cell.detailTextLabel.text = @"";
                        self.hasChangeAddress= NO;
                    }
                }
            }
            
        } else if (indexPath.section == 1) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if(indexPath.row ==0){
                cell.detailTextLabel.text=@"Choose Room Type";
                if(_hasChangeRoomType==YES){
                    if(RoomTypeNum==0){
                        cell.detailTextLabel.text=@"Apartment";
                    }else{
                        cell.detailTextLabel.text=@"House";
                    }
                }
            }else{
                cell.detailTextLabel.text=@"Input Room Title";
                if(_hasChangeRoomTitle==YES){
                    if([_Title isEqualToString:@""]){
                        _hasChangeRoomTitle=NO;
                    }else{
                        cell.detailTextLabel.text = _Title;
                    }
                }
            }
        } else if (indexPath.section == 2) {
            cell.detailTextLabel.text=@"-/-/-";
            if (indexPath.row == 0) {
                if(_hasChangeFromDate==YES){
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld/%ld/%ld",(long)_FromMonth,(long)_FromDay,(long)_FromYear];
                }
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            } else if (indexPath.row == 1) {
                if(_hasChangeToDate==YES){
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Date Error!"
                                                                   message:@"Please select from date again!"
                                                                  delegate:self
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil, nil];

                    if(_ToYear<_FromYear){
                        [alert show];
                    }else if(_ToYear==_FromYear && _ToMonth<_FromMonth){
                        [alert show];
                    }else if(_ToYear==_FromYear && _ToMonth==_FromMonth && _ToDay<_FromDay){
                        [alert show];
                    }else{
                        cell.detailTextLabel.text =[NSString stringWithFormat:@"%ld/%ld/%ld",(long)_ToMonth,(long)_ToDay,(long)_ToYear];
                    }
                }
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
        }else if (indexPath.section == 3){
            if(indexPath.row == 0){
                if(_hasChangePrice==YES){
                    cell.detailTextLabel.text=@"Input Price";
                    if(_Price>=0){
                        NSString *userinputroomprice =[NSString stringWithFormat:@"%lu $/M",_Price];
                        cell.detailTextLabel.text=userinputroomprice;
                    }else{
                        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Price Error!"
                                                                       message:@"Please input correct price!"
                                                                      delegate:self
                                                             cancelButtonTitle:@"OK"
                                                            otherButtonTitles:nil, nil];
                        [alert show];
                        _hasChangePrice=NO;
                    }
                }
            }else{
                if(_hasSelectRoomPhotos==YES){
                    UIImage *image = self.Bigimage;
                    [cell.imageView setImage:image];
                }
            }
        }
    
    return cell;
    
}

- (void)switchChanged:(id)sender {
    UISwitch *switchControl = sender;
    NSUserDefaults *userPreferences = [NSUserDefaults standardUserDefaults];
    [userPreferences setBool:switchControl.on forKey:@"switchControl"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return _array.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_array[section] count];
}

- (IBAction)exit:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 0) {
        if(indexPath.row==0){
            SelectState *selectStates = (SelectState *)[self.storyboard instantiateViewControllerWithIdentifier:@"SelectStates"];
            selectStates.selected = StatesNum;
            selectStates.delegate = self;
            _hasChangeStatesName=YES;
            if(_hasChangeCitysName==YES){
                _hasChangeCitysName=NO;
                CityNumber =0;
            }
            [self.navigationController pushViewController:selectStates animated:YES];
            UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                           initWithTitle: @"States"
                                           style: UIBarButtonItemStyleDone
                                           target: nil action: nil];
            [self.navigationItem setBackBarButtonItem:backButton];
        }else if(indexPath.row==1){
            if(_hasChangeCitysName==YES){
                SelectCity *selectCitys =(SelectCity *)[self.storyboard
                                                    instantiateViewControllerWithIdentifier:@"SelectCitys"];
                selectCitys.StatesNameUserSelected = StatesNum;
                selectCitys.selected = CityNumber;
                selectCitys.delegate=self;
                
                [self.navigationController pushViewController:selectCitys animated:YES];
                UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                               initWithTitle: @"City"
                                               style: UIBarButtonItemStyleDone
                                               target: nil action: nil];
                [self.navigationItem setBackBarButtonItem:backButton];

            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"ERROR!" message:@"Please select states first!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        }else{
            [self performSegueWithIdentifier:@"AddressInputSegue" sender:self];
        }
    }
    
    if (indexPath.section == 1) {
        if (indexPath.row ==0) {
            RoomType *selectRoom = (RoomType *)[self.storyboard instantiateViewControllerWithIdentifier:@"RoomTypeChoose"];
            selectRoom.selected = RoomTypeNum;
            _hasChangeRoomType=YES;
            selectRoom.delegate = self;
            [self.navigationController pushViewController:selectRoom animated:YES];
            UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                           initWithTitle: @"Room Type"
                                           style: UIBarButtonItemStyleDone
                                           target: nil action: nil];
            [self.navigationItem setBackBarButtonItem:backButton];

        }else{
            _hasChangeRoomTitle=YES;
            [self performSegueWithIdentifier:@"InputTitleSegue" sender:self];
        }
    }
    
    if (indexPath.section == 2) {
        if(indexPath.row==0){
            [self performSegueWithIdentifier:@"DatePickerSegue" sender:self];
        }else{
            if(_hasChangeFromDate==YES){
                [self performSegueWithIdentifier:@"DatePickerToSegue" sender:self];
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!"
                                                               message:@"Please select From Date First"
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil, nil];
                [alert show];
            }
        }
    }
    if(indexPath.section == 3){
        if(indexPath.row==0){
            [self performSegueWithIdentifier:@"InputPriceSegue" sender:self];
        }else{
            UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Add Photo"
                                                                    delegate:self
                                                           cancelButtonTitle:@"Cancel"
                                                      destructiveButtonTitle:nil
                                                           otherButtonTitles:@"Take Photo",@"Choose from Photos",nil];
            [actionSheet showInView:self.view];
        }
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == actionSheet.cancelButtonIndex)
    {
        [self.tableView reloadData];
        return;
    }
    switch (buttonIndex) {
        _hasSelectRoomPhotos=YES;
        case 0:
        {
            _myPhotoPicker = [[UIImagePickerController alloc] init];
            [_myPhotoPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
            self.myPhotoPicker.delegate = self;
            [_myPhotoPicker takePicture];
            [self presentViewController:_myPhotoPicker animated:YES completion:NULL];
            break;
        }
        case 1:
        {
            [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self.tableView reloadData];
            break;
        }
    }
}


- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    self.myPhotoPicker = [[UIImagePickerController alloc]init];
    self.myPhotoPicker.sourceType=sourceType;
    self.myPhotoPicker.delegate = self;
    [self presentViewController:self.myPhotoPicker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.Bigimage = info[UIImagePickerControllerOriginalImage];
    NSData *imageData = UIImagePNGRepresentation(self.Bigimage);
    
    if([imageData length]>10485760){
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!"
                                                       message:@"Your photo size is too big, please choose another one."
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
    }else{
        _hasSelectRoomPhotos=YES;
    };
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    _hasSelectRoomPhotos=NO;
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"AddressInputSegue"]){
        UINavigationController *navController = segue.destinationViewController;
        Input_Address *address = (Input_Address *)navController.topViewController;
        address.addressInput=_AddressString;
        [address setDelegate:self];
        return;
    }
    if([[segue identifier] isEqual:@"DatePickerSegue"]){
        UINavigationController *navDatePicker = segue.destinationViewController;
        DatePicker *dateFrom = (DatePicker *)navDatePicker.topViewController;
        dateFrom.title = @"Choose Start Time";
        [dateFrom setDelegate:self];
        return;
    }
    if([[segue identifier] isEqual:@"DatePickerToSegue"]){
        UINavigationController *navDatePickerTo= segue.destinationViewController;
        DatePickerTo *dateTo = (DatePickerTo *)navDatePickerTo.topViewController;
        dateTo.title=@"Choose End Time";
        [dateTo setDelegate: self];
        return;
    }
    if([[segue identifier] isEqual:@"InputPriceSegue"]){
        UINavigationController *navRoomPrice = segue.destinationViewController;
        InputPrice *inputPrice = (InputPrice *)navRoomPrice.topViewController;
        inputPrice.title=@"Price $/Month";
        [inputPrice setDelegate:self];
        return;
    }
    if([[segue identifier] isEqualToString:@"InputTitleSegue"]){
        UINavigationController *navRoomTitle = segue.destinationViewController;
        Title *setRoomTitle = (Title *) navRoomTitle.topViewController;
        setRoomTitle.title = @"Title";
        setRoomTitle.roomTitleString = self.Title;
        setRoomTitle.roomDescriptionString = self.roomDescription;
        [setRoomTitle setDelegate:self];
        return;
    }
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==3 && indexPath.row==1 && _hasSelectRoomPhotos==YES){
        CGFloat height = 80.0;
        return height;
    }else{
        CGFloat height = 50.0;
        return height;
    }
}

#pragma mark - Protocol Methods

-(void)setUpStates:(NSString *)statesName
{
    
    self.StatesName=statesName;

}

-(void)setUpStatesNum:(NSUInteger)statesNum
{

    self.StatesNum=statesNum;
    
}

-(void)setUpCitysName:(NSString *)cityName
{

    self.CityName=cityName;
    
}

-(void)setUpCitysNum:(NSUInteger)cityNum
{

    self.CityNumber=cityNum;
    
}

-(void)setAddressString:(NSString *)address
{

    if([address isEqualToString:@""]){
        _hasChangeAddress=NO;
    }else{
        _hasChangeAddress = YES;
        _AddressString=address;
    }
}

-(void)setRoomTypeNum:(NSUInteger)roomTypeNum
{
    
    RoomTypeNum = roomTypeNum;
    
}

-(void)setFromYear:(NSInteger)FromYear
{
    _FromYear=FromYear;
    
}

-(void)setFromMonth:(NSInteger)FromMonth
{

    _FromMonth=FromMonth;
}

-(void)setFromDay:(NSInteger)FromDay
{

    _FromDay=FromDay;
    _hasChangeFromDate=YES;
}

-(void)setToYear:(NSInteger)ToYear
{
    _ToYear=ToYear;
}


-(void)setToMonth:(NSInteger)ToMonth
{
    _ToMonth = ToMonth;
}

-(void)setToDay:(NSInteger)ToDay
{
    _ToDay=ToDay;
    _hasChangeToDate=YES;
}

-(void)setUpRoomPrice:(NSInteger)roomprice
{
    
    _Price=roomprice;
    _hasChangePrice=YES;
}

-(void)setRoomTitle:(NSString *)RoomTitle
{
    _Title = RoomTitle;
    _hasChangeRoomTitle =YES;

}

-(void)setRoomDescription:(NSString *)description
{
    _roomDescription = description;
    
}

-(void)PublishRooms:(id)sender
{
    
    if(_hasChangeStatesName==YES && _hasChangeCitysName ==YES && _hasChangeRoomType==YES &&
       _hasChangeFromDate==YES && _hasChangeToDate ==YES && _hasChangePrice==YES && _hasChangeRoomTitle==YES){
        NSData *imageData = UIImagePNGRepresentation(self.Bigimage);
        
        PFFile *imageFile = [PFFile fileWithName:@"RoomImage.png" data:imageData];
        PFObject *test =  [PFObject objectWithClassName:@"PostInfo"];
        
        NSNumber *data = [NSNumber numberWithInteger:_FromYear];
        test[@"FromYear"]=data;
        
        data = [NSNumber numberWithInteger:_FromMonth];
        test[@"FromMonth"]=data;
        
        data= [NSNumber numberWithInteger:_FromDay];
        test[@"FromDay"] = data;
        
        data = [NSNumber numberWithInteger:_ToYear];
        test[@"ToYear"] = data;
        
        data = [NSNumber numberWithInteger:_ToMonth];
        test[@"ToMonth"] = data;

        data = [NSNumber numberWithInteger:_ToDay];
        test[@"ToDay"] = data;
        
        data = [NSNumber numberWithInteger:_Price];
        test[@"Price"] = data;
        
        test[@"Image"]=imageFile;
        test[@"description"] = _roomDescription;
        
        
        test[@"UserName"]=@"mmmmmmmmmmmmmmmmm";
//        NSString *myadd = _AddressString;
        test[@"Address"] = _AddressString;
        
        [self getCoordinateByAddress:_AddressString];
        data = [NSNumber numberWithFloat:longitude];
        test[@"Longitude"] = data;
        
        data = [NSNumber numberWithFloat:latitude];
        test[@"Latitude"] = data;
        
        data = [NSNumber numberWithInt:1];
        test[@"NeedTenant"] = data;
        
        test[@"Title"] = _Title;
        [test saveInBackground];
        
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Succeed!"
                                                       message:@"You have post this information!"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!"
                                                       message:@"Please fill required infomation"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
        
        [alert show];
    }

}

-(void)getCoordinateByAddress:(NSString *)address
{
    
    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *plackmark = [placemarks firstObject];
        
        CLLocation *location = plackmark.location;
        
        //区域
//        CLRegion *region = plackmark.region;
//        
//        NSDictionary *addressDic = plackmark.addressDictionary;
//        
//        // street
//        NSString *thoroughfare = plackmark.thoroughfare;
//        
//        //corelatted street information
//        NSString * subThoroughfare = plackmark.subThoroughfare;
//        
        //city
        NSString *locality=plackmark.locality; // 城市
        
//        NSString *subLocality=plackmark.subLocality; // 城市相关信息，例如标志性建筑
        
        //state
        NSString *administrativeArea=plackmark.administrativeArea; // 州
        
//        NSString *subAdministrativeArea=plackmark.subAdministrativeArea; //其他行政区域信息
//        
//        NSString *postalCode=plackmark.postalCode; //邮编
//        
        NSString *country=plackmark.country; //国家
        
        latitude =location.coordinate.latitude;
        longitude = location.coordinate.longitude;
        
        NSLog(@"country: %@\n, state : %@\n, @city: %@",country,administrativeArea,locality);
        NSLog(@"latitude is %f,longitude is %f",location.coordinate.latitude,location.coordinate.longitude);
        
    }];
    
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
