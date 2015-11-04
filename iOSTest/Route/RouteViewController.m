//
//  RouteViewController.m
//  Test
//
//  Created by John Zhao on 10/10/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "RouteViewController.h"
#import "PVPark.h"

@interface RouteViewController () <MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView              *mapView;

@property (nonatomic, strong) PVPark                        *park;
@property (nonatomic, strong) MKRoute                       *route;

- (IBAction)routePressed:(id)sender;

@end

@implementation RouteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.park = [[PVPark alloc] initWithFilename:@"route"];

//    CLLocationDegrees latDelta = self.park.overlayTopLeftCoordinate.latitude - self.park.overlayBottomRightCoordinate.latitude;
//
//    MKCoordinateSpan span = MKCoordinateSpanMake(fabs(latDelta), 0.0);
//    MKCoordinateRegion region = MKCoordinateRegionMake(self.park.midCoordinate, span);
//    self.mapView.region = region;

    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow];
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

- (IBAction)routePressed:(id)sender {
    MKPlacemark *originPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.park.overlayTopLeftCoordinate addressDictionary:nil];
    MKMapItem *originItem = [[MKMapItem alloc] initWithPlacemark:originPlacemark];

    MKPlacemark *destinationPlacemark = [[MKPlacemark alloc] initWithCoordinate:self.park.overlayBottomRightCoordinate addressDictionary:nil];
    MKMapItem *destinationItem = [[MKMapItem alloc] initWithPlacemark:destinationPlacemark];

    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    [request setSource:originItem];
    [request setDestination:destinationItem];

    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"Calculate direction failed with error: %@", [error localizedDescription]);
        }
        else {
            NSLog(@"Calculate direction complete without error.");
            self.route = response.routes[0];
            [self.mapView addOverlay:self.route.polyline level:MKOverlayLevelAboveRoads];
        }
    }];
}

#pragma mark -
#pragma mark MKMapViewDelegate

- (MKOverlayRenderer*)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor greenColor];
    renderer.alpha = 0.4f;
    return renderer;
}

@end
