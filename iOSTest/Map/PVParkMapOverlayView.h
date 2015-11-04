//
//  PVParkMapOverlayView.h
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface PVParkMapOverlayView : MKOverlayRenderer

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage*)overlayImage;

@end
