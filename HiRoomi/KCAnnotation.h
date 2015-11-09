//
//  KCAnnotation.h
//  HiRoomi
//
//  Created by mizhang on 8/2/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>



@interface KCAnnotation : NSObject<MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) UIImage *image;

@end
