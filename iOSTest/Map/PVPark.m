//
//  PVPark.m
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "PVPark.h"

@implementation PVPark

- (instancetype)initWithFilename:(NSString *)filename {
    self = [super init];
    if (self != nil) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];
        NSDictionary *properties = [NSDictionary dictionaryWithContentsOfFile:filePath];

//        CGPoint midPoint = CGPointFromString(properties[@"midCoord"]);
//        _midCoordinate = CLLocationCoordinate2DMake(midPoint.x, midPoint.y);

        CGPoint overlayTopLeftPoint = CGPointFromString(properties[@"overlayTopLeftCoord"]);
        _overlayTopLeftCoordinate = CLLocationCoordinate2DMake(overlayTopLeftPoint.x, overlayTopLeftPoint.y);

        CGPoint overlayBottomRightPoint = CGPointFromString(properties[@"overlayBottomRightCoord"]);
        _overlayBottomRightCoordinate = CLLocationCoordinate2DMake(overlayBottomRightPoint.x, overlayBottomRightPoint.y);

        NSArray *boundaryPoints = properties[@"boundary"];
        _boundaryPointsCount = boundaryPoints.count;
        _boundary = malloc(sizeof(CLLocationCoordinate2D) * _boundaryPointsCount);
        for (int i=0; i<_boundaryPointsCount; ++i) {
            CGPoint p = CGPointFromString(boundaryPoints[i]);
            _boundary[i] = CLLocationCoordinate2DMake(p.x, p.y);
        }
    }
    return self;
}

- (CLLocationCoordinate2D)midCoordinate {
    double latitude = (self.overlayTopLeftCoordinate.latitude + self.overlayBottomRightCoordinate.latitude) / 2.0;
    double longitude = (self.overlayTopLeftCoordinate.longitude + self.overlayBottomRightCoordinate.longitude) / 2.0;
    return CLLocationCoordinate2DMake(latitude, longitude);
}

- (CLLocationCoordinate2D)overlayBottomLeftCoordinate {
//    return CLLocationCoordinate2DMake(self.overlayBottomLeftCoordinate.latitude, self.overlayTopRightCoordinate.longitude);
    return CLLocationCoordinate2DMake(self.overlayBottomRightCoordinate.latitude, self.overlayTopLeftCoordinate.longitude);
}

- (CLLocationCoordinate2D)overlayTopRightCoordinate {
    return CLLocationCoordinate2DMake(self.overlayTopLeftCoordinate.latitude, self.overlayBottomRightCoordinate.longitude);
}

- (MKMapRect)overlayBoundingMapRect {
    MKMapPoint topLeft = MKMapPointForCoordinate(self.overlayTopLeftCoordinate);
    MKMapPoint topRight = MKMapPointForCoordinate(self.overlayTopRightCoordinate);
    MKMapPoint bottomLeft = MKMapPointForCoordinate(self.overlayBottomLeftCoordinate);

    return MKMapRectMake(topLeft.x, topLeft.y, fabs(topLeft.x - topRight.x), fabs(topLeft.y - bottomLeft.y));
}

@end
