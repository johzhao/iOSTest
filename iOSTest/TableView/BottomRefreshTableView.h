//
//  BottomRefreshTableView.h
//  Test
//
//  Created by John Zhao on 10/26/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BottomRefreshTableView;

@protocol BottomRefreshTableViewDataSource <NSObject>

- (void)tableViewRequestToUpdateData:(BottomRefreshTableView*)tableView;

@end



@interface BottomRefreshTableView : UITableView

@property (nonatomic, weak) id<BottomRefreshTableViewDataSource>            updateDataSource;
@property (nonatomic, weak) id<UITableViewDelegate>                         tableViewDelegate;

- (void)viewDidAppear;

@end
