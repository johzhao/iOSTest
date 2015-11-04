//
//  TableViewBottomRefreshViewController.m
//  Test
//
//  Created by John Zhao on 10/26/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "TableViewBottomRefreshViewController.h"
#import "BottomRefreshTableView.h"

@interface TableViewBottomRefreshViewController () <UITableViewDataSource, UITableViewDelegate, BottomRefreshTableViewDelegate>

@property (nonatomic, strong) NSMutableArray                        *itemArray;
@property (nonatomic, assign) IBOutlet BottomRefreshTableView       *tableView;

@end

@implementation TableViewBottomRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView.updateDataDelegate = self;

    self.itemArray = [NSMutableArray array];
    [self requestToGetMoreFrom:self.itemArray.count];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.tableView viewDidAppear];
}

- (void)refreshPressed:(id)sender {
    UIEdgeInsets defaultEdgeInsets = self.tableView.contentInset;
    NSLog(@"%@", NSStringFromUIEdgeInsets(defaultEdgeInsets));
}

- (void)requestToGetMoreFrom:(NSInteger)begin {
    NSLog(@"Request from %ld", (long)begin);

    NSMutableArray *array = [NSMutableArray array];
    NSInteger end = begin + 10;
    for (NSInteger i=begin; i<end; ++i) {
        if (i < 60) {
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
}

- (void)appendDownloadedDataArray:(NSArray*)array {
    [self.tableView beginUpdates];

    NSInteger begin = self.itemArray.count;
    NSInteger count = array.count;
    NSMutableArray *indexArray = [NSMutableArray array];
    for (NSInteger i=0; i<count; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i+begin inSection:0];
        [indexArray addObject:indexPath];
    }
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];

    [self.itemArray addObjectsFromArray:array];

    [self.tableView endUpdates];
}

- (void)nomoreDataAvailable {
    [self.tableView beginUpdates];

    [self.tableView endUpdates];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCellIdentifier"];
    cell.textLabel.text = [self.itemArray objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - BottomRefreshTableViewDelegate

- (void)tableViewRequestToUpdateData:(BottomRefreshTableView*)tableView {
    NSLog(@"Handle update data request.");

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self requestToGetMoreFrom:self.itemArray.count];
    });
}

- (void)tableView:(BottomRefreshTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

@end
