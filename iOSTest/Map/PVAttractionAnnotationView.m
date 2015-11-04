//
//  PVAttractionAnnotationView.m
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "PVAttractionAnnotationView.h"
#import "PVAttractionAnnotation.h"

@implementation PVAttractionAnnotationView

- (instancetype)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        PVAttractionAnnotation *attractionAnnotation = self.annotation;
        switch (attractionAnnotation.type) {
            case PVAttractionFirstAid:
                self.image = [UIImage imageNamed:@"firstaid"];
                break;
            case PVAttractionFood:
                self.image = [UIImage imageNamed:@"food"];
                break;
            case PVAttractionRide:
                self.image = [UIImage imageNamed:@"ride"];
                break;
            default:
                self.image = [UIImage imageNamed:@"star"];
                break;
        }

        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        self.rightCalloutAccessoryView = rightButton;

        self.leftCalloutAccessoryView = [[UIImageView alloc] initWithImage:self.image];
    }
    return self;
}

@end
