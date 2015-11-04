//
//  BottomRefreshTableView.h
//  Test
//
//  Created by John Zhao on 10/26/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BottomRefreshTableView;

@protocol BottomRefreshTableViewDelegate <NSObject>

- (void)tableViewRequestToUpdateData:(BottomRefreshTableView*)tableView;

- (void)tableView:(BottomRefreshTableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end



@interface BottomRefreshTableView : UITableView

@property (nonatomic, assign) id<BottomRefreshTableViewDelegate>            updateDataDelegate;

- (void)viewDidAppear;

@end
