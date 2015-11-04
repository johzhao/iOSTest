//
//  CommonCellDataSource.h
//  Test
//
//  Created by John Zhao on 9/21/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CommonCellConfigureBlock)(id cell, id item);

@interface CommonCellDataSource : NSObject <UITableViewDataSource, UICollectionViewDataSource>

- (instancetype)initWithItems:(NSArray*)items cellIdentifier:(NSString*)cellIdentifier configureBolck:(CommonCellConfigureBlock)configureBlock;

@end
