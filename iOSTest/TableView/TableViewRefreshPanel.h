//
//  TableViewRefreshPanel.h
//  Test
//
//  Created by John Zhao on 10/26/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RefreshPanelStatus) {
    RefreshPanelStatusIdle,
    RefreshPanelStatusPrepareLoading,
    RefreshPanelStatusLoading,
};

@interface TableViewRefreshPanel : UIView

@property (nonatomic, assign) RefreshPanelStatus                status;

@end
