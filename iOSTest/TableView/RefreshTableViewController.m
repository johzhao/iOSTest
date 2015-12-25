//
//  RefreshTableViewController.m
//  iOSTest
//
//  Created by John Zhao on 11/17/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "RefreshTableViewController.h"
#import "MJRefresh.h"

@interface RefreshTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView                    *tableView;
@property (nonatomic, strong) NSMutableArray                        *dataArray;

@end

@implementation RefreshTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArray = [NSMutableArray array];
    for (NSInteger i=0; i<10; ++i) {
        NSString *string = [NSString stringWithFormat:@"Data %08lu", (long)i];
        [self.dataArray addObject:string];
    }

    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^ {
        [self requestToGetMore];
    }];
//    [self.tableView.mj_footer beginRefreshing];
}

- (void)requestToGetMore {
    NSLog(@"Request to get more");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *array = [NSMutableArray array];
        NSInteger begin = self.dataArray.count;
        NSInteger end = begin + 10;
        for (NSInteger i=begin; i<end; ++i) {
            NSString *string = [NSString stringWithFormat:@"Data %08lu", (long)i];
            [array addObject:string];
        }

        [self appendDownloadedDataArray:array];
    });
}

- (void)appendDownloadedDataArray:(NSArray*)array {
    NSInteger beginIndex = self.dataArray.count;
    [self.dataArray addObjectsFromArray:array];

    [self.tableView beginUpdates];

    NSInteger count = array.count;
    NSMutableArray *indexArray = [NSMutableArray array];
    for (NSInteger i=0; i<count; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:beginIndex + i inSection:0];
        [indexArray addObject:indexPath];
    }
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];

    [self.tableView endUpdates];

//    [self.refreshControl endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RefreshTableViewCellIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
