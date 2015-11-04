//
//  PVParkMapOverlay.h
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class PVPark;

@interface PVParkMapOverlay : NSObject <MKOverlay>

- (instancetype)initWithPark:(PVPark*)park;

@end
