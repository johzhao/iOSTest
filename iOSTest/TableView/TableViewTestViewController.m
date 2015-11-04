//
//  TableViewTestViewController.m
//  Test
//
//  Created by John Zhao on 10/15/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "TableViewTestViewController.h"
#import "ActivityTableViewCell.h"

@interface TableViewTestViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView                    *tableView;

@property (nonatomic, strong) NSMutableArray                        *dataArray;
@property (nonatomic, weak) ActivityTableViewCell                   *activityCell;
@property (nonatomic, assign) BOOL                                  requestInProgress;
@property (nonatomic, assign) BOOL                                  noMoreData;

@end

@implementation TableViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray array];

    for (NSInteger i=0; i<20; ++i) {
        NSString *string = [NSString stringWithFormat:@"Data %08lu", (long)i];
        [self.dataArray addObject:string];
    }

    // Add right button in navigation bar
    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                 target:self
                                                                                 action:@selector(editPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;

    [self requestToGetMoreFrom:self.dataArray.count];
}

- (void)editPressed:(id)sender {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (void)requestToGetMoreFrom:(NSInteger)begin {
    NSLog(@"Request from %ld", (long)begin);

    self.requestInProgress = YES;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *array = [NSMutableArray array];
        NSInteger end = begin + 10;
        for (NSInteger i=begin; i<end; ++i) {
            if (i <= 30) {
                NSString *string = [NSString stringWithFormat:@"Data %08lu", (long)i];
                [array addObject:string];
            }
        }

        if (array.count > 0) {
            [self appendDownloadedDataArray:array];
        }
        else {
            [self nomoreDataAvailable];
        }
    });
}

- (void)appendDownloadedDataArray:(NSArray*)array {
    [self.tableView beginUpdates];

    NSInteger begin = self.dataArray.count;
    NSInteger count = array.count;
    NSMutableArray *indexArray = [NSMutableArray array];
    for (NSInteger i=0; i<count; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i+begin inSection:0];
        [indexArray addObject:indexPath];
    }
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];

    [self.dataArray addObjectsFromArray:array];

    [self.tableView endUpdates];

    self.requestInProgress = NO;

    NSArray *visibleCells = [self.tableView visibleCells];
    if ([visibleCells containsObject:self.activityCell]) {
        [self requestToGetMoreFrom:self.dataArray.count];
    }
}

- (void)nomoreDataAvailable {
    self.noMoreData = YES;

    if (self.activityCell != nil) {
        [self.tableView beginUpdates];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:self.activityCell];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];

        self.activityCell = nil;
    }
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.noMoreData) {
        return self.dataArray.count;
    }
    else {
        return self.dataArray.count + 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    if (indexPath.row == (NSInteger)self.dataArray.count) {
        self.activityCell = [tableView dequeueReusableCellWithIdentifier:@"TableViewTestActivityCellIdentifier" forIndexPath:indexPath];
        cell = self.activityCell;
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewTestCellIdentifier" forIndexPath:indexPath];
        cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {

}

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSString*)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Undelete";
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (cell == self.activityCell) {
        [self.activityCell.activity startAnimating];

//        if (!self.requestInProgress) {
//            [self requestToGetMoreFrom:self.dataArray.count];
//        }
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
    if (cell == self.activityCell) {
        [self.activityCell.activity stopAnimating];
    }
}

@end
