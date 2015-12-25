//
//  CellHeightTableViewController.m
//  iOSTest
//
//  Created by John Zhao on 12/25/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "CellHeightTableViewController.h"

@interface CellHeightTableViewController ()

@property (nonatomic, strong) NSArray               *dataSourceArray;

@end

@implementation CellHeightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Cell Height";

    self.tableView.estimatedRowHeight = 44.0f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.dataSourceArray = @[
                             @"This was the first cell.",
                             @"This was the second cell. This was the second cell. This was the second cell. This was the second cell. This was the second cell. This was the second cell. This was the second cell. This was the second cell. This was the second cell. This was the second cell. This was the second cell. ",
                             @"This was the third cell. This was the third cell. This was the third cell. This was the third cell. This was the third cell. This was the third cell. ",
                             ];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CellHeightCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.label.text = [self.dataSourceArray objectAtIndex:indexPath.row];
    return cell;
}

@end


@implementation CellHeightCell

@end
