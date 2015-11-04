//
//  PVPark.h
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PVPark : NSObject

@property (nonatomic, readonly) CLLocationCoordinate2D      *boundary;
@property (nonatomic, readonly) NSInteger                   boundaryPointsCount;

@property (nonatomic, readonly) CLLocationCoordinate2D      midCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D      overlayTopLeftCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D      overlayTopRightCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D      overlayBottomLeftCoordinate;
@property (nonatomic, readonly) CLLocationCoordinate2D      overlayBottomRightCoordinate;

@property (nonatomic, readonly) MKMapRect                   overlayBoundingMapRect;

@property (nonatomic, copy) NSString                        *name;

- (instancetype)initWithFilename:(NSString*)filename;

@end
