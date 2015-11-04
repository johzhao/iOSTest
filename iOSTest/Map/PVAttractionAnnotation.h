//
//  PVAttractionAnnotation.h
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

typedef NS_ENUM(NSInteger, PVAttractionType) {
    PVAttractionDefault = 0,
    PVAttractionRide,
    PVAttractionFood,
    PVAttractionFirstAid
};

@interface PVAttractionAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D            coordinate;
@property (nonatomic, copy) NSString                            *title;
@property (nonatomic, copy) NSString                            *subtitle;
@property (nonatomic, assign) PVAttractionType                  type;

@end
