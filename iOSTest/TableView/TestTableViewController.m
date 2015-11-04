//
//  TestTableViewController.m
//  Test
//
//  Created by John Zhao on 10/16/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "TestTableViewController.h"
#import "AccessoryTableViewCell.h"

@interface TestTableViewController ()

@property (nonatomic, strong) NSMutableArray                        *dataArray;

@end

@implementation TestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

    self.dataArray = [NSMutableArray array];

    NSMutableArray *array = [NSMutableArray array];
    NSInteger begin = self.dataArray.count;
    NSInteger end = begin + 10;
    for (NSInteger i=begin; i<end; ++i) {
        NSString *string = [NSString stringWithFormat:@"Data %08lu", (long)i];
        [array insertObject:string atIndex:0];
    }

    [self appendDownloadedDataArray:array];
}

- (IBAction)refreshValueChanged:(id)sender {
    [self requestToGetMore];
}

- (void)requestToGetMore {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *array = [NSMutableArray array];
        NSInteger begin = self.dataArray.count;
        NSInteger end = begin + 10;
        for (NSInteger i=begin; i<end; ++i) {
            NSString *string = [NSString stringWithFormat:@"Data %08lu", (long)i];
            [array insertObject:string atIndex:0];
        }

        [self appendDownloadedDataArray:array];
    });
}

- (void)appendDownloadedDataArray:(NSArray*)array {
    [self.tableView beginUpdates];

    NSInteger count = array.count;
    NSMutableArray *indexArray = [NSMutableArray array];
    for (NSInteger i=0; i<count; ++i) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexArray addObject:indexPath];
    }
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];

    [self.dataArray insertObjects:array atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, count)]];

    [self.tableView endUpdates];

    [self.refreshControl endRefreshing];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AccessoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTableViewCellIdentifier"];
    
    // Configure the cell...
    cell.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.num = indexPath.row;

    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Accessory button tapped for row: %ld", (long)indexPath.row);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
