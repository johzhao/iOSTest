//
//  PVParkMapOverlay.m
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "PVParkMapOverlay.h"
#import "PVPark.h"

@interface PVParkMapOverlay ()

@end

@implementation PVParkMapOverlay

@synthesize coordinate;
@synthesize boundingMapRect;

- (instancetype)initWithPark:(PVPark *)park {
    self = [super init];
    if (self != nil) {
//        boundingMapRect = park.overlayBoundingMapRect;
        boundingMapRect.origin = MKMapPointForCoordinate(park.midCoordinate);
        boundingMapRect.size.width = 5000.0;
        boundingMapRect.size.height = 5000.0;
        coordinate = park.midCoordinate;
    }
    return self;
}

@end
