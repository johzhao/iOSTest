//
//  ViewController.m
//  iOSTest
//
//  Created by John Zhao on 11/4/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray                           *itemArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.itemArray = @[
                       @"AttributeString",
                       @"AutoLayout",
                       @"Carousel",
                       @"Chat",
                       @"Container",
                       @"CoreText",
                       @"DiskButtons",
                       @"DoorState",
                       @"GasView",
                       @"ImageTextButton",
                       @"Map",
                       @"Popover",
                       @"Presentation",
                       @"Route",
                       @"ScrollView",
                       @"Segment",
                       @"TableView",
                       @"TextField",
                       @"TextKit",
                       @"TTSEngine",
                       @"WebView",
                       @"CellHeight",
                       ];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RootCellIdentifier"];
    cell.textLabel.text = [self.itemArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    NSString *name = [self.itemArray objectAtIndex:indexPath.row];
    UIViewController *vc = nil;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:name bundle:nil];
    if (storyboard != nil) {
        vc = [storyboard instantiateInitialViewController];
    }
    else {
        NSLog(@"Can't load storyboard: %@", name);
    }

    if (vc != nil) {
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {
        NSLog(@"Failed to load initial viewcontroller from %@ storyboard.", name);
    }
}

@end
