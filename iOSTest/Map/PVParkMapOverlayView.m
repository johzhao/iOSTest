//
//  PVParkMapOverlayView.m
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "PVParkMapOverlayView.h"

@interface PVParkMapOverlayView ()

@property (nonatomic, strong) UIImage       *overlayImage;

@end

@implementation PVParkMapOverlayView

- (instancetype)initWithOverlay:(id<MKOverlay>)overlay overlayImage:(UIImage*)overlayImage {
    self = [super initWithOverlay:overlay];
    if (self != nil) {
        _overlayImage = overlayImage;
        self.alpha = 0.3f;
    }
    return self;
}

- (void)drawMapRect:(MKMapRect)mapRect zoomScale:(MKZoomScale)zoomScale inContext:(CGContextRef)context {
//    CGImageRef imageReference = self.overlayImage.CGImage;

    MKMapRect theMapRect = self.overlay.boundingMapRect;
    CGRect theRect = [self rectForMapRect:theMapRect];

//    CGContextScaleCTM(context, 1.0, -1.0);
//    CGContextTranslateCTM(context, 0.0, -theRect.size.height);
//    CGContextDrawImage(context, theRect, imageReference);

    CGContextSetFillColorWithColor(context, [[UIColor redColor] CGColor]);
    CGContextFillEllipseInRect(context, theRect);
}

@end
