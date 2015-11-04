//
//  MapViewController.m
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MapViewController.h"
#import "PVPark.h"
#import "PVParkMapOverlay.h"
#import "PVParkMapOverlayView.h"
#import "PVAttractionAnnotation.h"
#import "PVAttractionAnnotationView.h"

@interface MapViewController () <MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView              *mapView;
@property (nonatomic, weak) IBOutlet UISegmentedControl     *mapTypeSegmentedControl;

@property (nonatomic, strong) PVPark                        *park;
@property (nonatomic, strong) NSMutableArray                *selectedOptions;

- (IBAction)mapTypeChanged:(id)sender;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectedOptions = [NSMutableArray array];
    self.park = [[PVPark alloc] initWithFilename:@"MagicMountain"];

    CLLocationDegrees latDelta = self.park.overlayTopLeftCoordinate.latitude - self.park.overlayBottomRightCoordinate.latitude;

    MKCoordinateSpan span = MKCoordinateSpanMake(fabs(latDelta), 0.0);
    MKCoordinateRegion region = MKCoordinateRegionMake(self.park.midCoordinate, span);
    self.mapView.region = region;

    [self addOverlay];
    [self addAttractionPins];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)mapTypeChanged:(id)sender {
    switch (self.mapTypeSegmentedControl.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        default:
            break;
    }
}

- (void)addOverlay {
    PVParkMapOverlay *overlay = [[PVParkMapOverlay alloc] initWithPark:self.park];
    [self.mapView addOverlay:overlay level:MKOverlayLevelAboveRoads];
}

- (void)addAttractionPins {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MagicMountainAttractions" ofType:@"plist"];
    NSArray *attractions = [NSArray arrayWithContentsOfFile:filePath];
    for (NSDictionary *attraction in attractions) {
        PVAttractionAnnotation *annotation = [[PVAttractionAnnotation alloc] init];
        CGPoint point = CGPointFromString(attraction[@"location"]);
        annotation.coordinate = CLLocationCoordinate2DMake(point.x, point.y);
        annotation.title = attraction[@"name"];
        annotation.type = [attraction[@"type"] integerValue];
        annotation.subtitle = attraction[@"subtitle"];

        [self.mapView addAnnotation:annotation];
    }
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKOverlayRenderer*)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[PVParkMapOverlay class]]) {
        UIImage *magicMountainImage = [UIImage imageNamed:@"overlay_park"];
        PVParkMapOverlayView *overlayView = [[PVParkMapOverlayView alloc] initWithOverlay:overlay overlayImage:magicMountainImage];
        return overlayView;
    }

    return nil;
}

- (MKAnnotationView*)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    PVAttractionAnnotationView *annotationView = [[PVAttractionAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"Attraction"];
    annotationView.canShowCallout = YES;
    return annotationView;
}

@end
