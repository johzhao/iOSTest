//
//  CommonCellDataSource.m
//  Test
//
//  Created by John Zhao on 9/21/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "CommonCellDataSource.h"

@interface CommonCellDataSource ()

@property (nonatomic, copy) NSArray                                 *itemArray;
@property (nonatomic, copy) NSString                                *cellIdentifier;
@property (nonatomic, copy) CommonCellConfigureBlock                configureBlock;

- (id)itemAtIndexPath:(NSIndexPath*)indexPath;

@end

@implementation CommonCellDataSource

- (instancetype)initWithItems:(NSArray*)items cellIdentifier:(NSString*)cellIdentifier configureBolck:(CommonCellConfigureBlock)configureBlock {
    self = [super init];
    if (self != nil) {
        _itemArray = [items copy];
        _cellIdentifier = [cellIdentifier copy];
        _configureBlock = [configureBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath*)indexPath {
    return [self.itemArray objectAtIndex:indexPath.row];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    self.configureBlock(cell, [self itemAtIndexPath:indexPath]);
    return cell;
}

#pragma mark -
#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    self.configureBlock(cell, [self itemAtIndexPath:indexPath]);
    return cell;
}

@end
