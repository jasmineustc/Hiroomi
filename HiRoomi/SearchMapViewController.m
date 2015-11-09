//
//  SearchMapViewController.m
//  HiRoomi
//
//  Created by mizhang on 8/2/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "SearchMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "KCAnnotation.h"


@interface SearchMapViewController()<CLLocationManagerDelegate,MKMapViewDelegate>

@property  (nonatomic)  CLLocationManager *locationManage;
@property (nonatomic) CLGeocoder *geocoder;

@end

@implementation SearchMapViewController

@synthesize locationManage,geocoder,mapView;



-(void)viewDidLoad
{
    [super viewDidLoad];

    geocoder = [[CLGeocoder alloc]init];
    locationManage = [[CLLocationManager alloc] init];
    
    mapView.showsUserLocation = YES;
    mapView.mapType = MKMapTypeStandard;
    mapView.delegate = self;

    [self.locationManage requestAlwaysAuthorization];
    [self.locationManage requestWhenInUseAuthorization];

    if([locationManage locationServicesEnabled]){
        if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined){
            [locationManage requestWhenInUseAuthorization];
        }else if([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse){
            locationManage.delegate = self;
            locationManage.desiredAccuracy=kCLLocationAccuracyBest;
            locationManage.distanceFilter = 10.0;
            [locationManage startUpdatingLocation];
            
        }
        [locationManage startUpdatingLocation];
    }
    
    NSLog(@"LONGTITUDE IS %f",locationManage.location.coordinate.longitude);
    NSLog(@"LONGTITUDE IS %f",locationManage.location.coordinate.latitude);
    
    [mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];

    [self getCoordinateByAddress:@"4601 Bayard Street"];
    [self initGUI];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getCoordinateByAddress:(NSString *)address
{
    
    [geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *plackmark = [placemarks firstObject];
        
        CLLocation *location = plackmark.location;
        
        //city
        NSString *locality=plackmark.locality; // 城市
        
        //state
        NSString *administrativeArea=plackmark.administrativeArea; // 州
        
        
        NSString *country=plackmark.country; //国家
        
        
        NSLog(@"country: %@\n, state : %@\n, @city: %@",country,administrativeArea,locality);
        NSLog(@"latitude is %f,longitude is %f",location.coordinate.latitude,location.coordinate.longitude);
        
    }];
    
}



-(void)initGUI
{
    [self addAnnotation:-79.951284  latitude:40.449856 title:@"mizhang" subtitle:@"description ~~~~~~~~~~~"];
    
}



-(void)addAnnotation:(float)longitude latitude:(float)latitude title:(NSString *)roomTitle subtitle:(NSString *)roomSubTitle
{
    CLLocationCoordinate2D location=CLLocationCoordinate2DMake(latitude,longitude);
    
    KCAnnotation *ann = [[KCAnnotation alloc]init];
    ann.coordinate = location;
    ann.title = roomTitle;
    ann.subtitle = roomSubTitle;
    ann.image = [UIImage imageNamed:@"1.png"];
    [self.mapView addAnnotation:ann];
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"$$$$$$$$$$$$$$$$$$$ %f,$$$%f",userLocation.coordinate.longitude,userLocation.coordinate.latitude);
    //    MKCoordinateSpan span=MKCoordinateSpanMake(0.01, 0.01);
    //    MKCoordinateRegion region=MKCoordinateRegionMake(userLocation.location.coordinate, span);
    //    [mapView setRegion:region animated:true];
    
}



-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    CLLocation *location=[locations firstObject];//取出第一个位置
    CLLocationCoordinate2D coordinate=location.coordinate;//位置坐标
    NSLog(@"经度：%f,纬度：%f,海拔：%f,航向：%f,行走速度：%f",coordinate.longitude,coordinate.latitude,location.altitude,location.course,location.speed);
    
}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[KCAnnotation class]]){
        static NSString *key1 = @"AnnotationKey1";
        MKPinAnnotationView *view = (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:key1];
        if(!view){
            view = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:key1];
            
            UIView *viewLeftAccessory = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
            NSLog(@"view frame.height is %f, view frame. %f",view.frame.size.width, view.frame.size.height);
            
            UIImageView *temp=[[UIImageView alloc] initWithFrame:CGRectMake(0,0, view.frame.size.width, view.frame.size.height)];
            
            temp.image = [UIImage imageNamed:@"1.png"];
            temp.contentMode =UIViewContentModeScaleAspectFit;
            [viewLeftAccessory addSubview:temp];
            
            //could also set it as green or purple
            view.pinColor = MKPinAnnotationColorRed;
            view.canShowCallout = YES;
            view.calloutOffset = CGPointMake(0, 1);
            view.leftCalloutAccessoryView = viewLeftAccessory;
            
            UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            view.rightCalloutAccessoryView = infoButton;
        }
        
        view.annotation = annotation;
        return view;
        /*
         
         static NSString *key1 = @"AnnotationKey1";
         MKAnnotationView *view = [self.mapView dequeueReusableAnnotationViewWithIdentifier:key1];
         if(!view){
         
         view = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:key1];
         
         view.canShowCallout = YES;
         view.calloutOffset = CGPointMake(0, 1);
         view.leftCalloutAccessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.png"]];
         }
         
         view.annotation = annotation;
         view.image =(((KCAnnotation *)annotation).image);
         
         */
        
    }else{
        return  nil;
    }
}


-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"this is idetifier %@", view.reuseIdentifier);
    NSLog(@"the annotation is selected******************");

}




@end















