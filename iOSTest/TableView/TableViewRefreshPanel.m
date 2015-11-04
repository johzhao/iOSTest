//
//  TableViewRefreshPanel.m
//  Test
//
//  Created by John Zhao on 10/26/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "TableViewRefreshPanel.h"

@interface TableViewRefreshPanel ()

@property (nonatomic, weak) UILabel                 *label;

@end

@implementation TableViewRefreshPanel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        _label = label;
    }
    return self;
}

- (void)setStatus:(RefreshPanelStatus)status {
    _status = status;

    switch (status) {
        case RefreshPanelStatusIdle: {
            [self changedToIdleStatus];
            break;
        }

        case RefreshPanelStatusPrepareLoading: {
            [self changedToPrepareStatus];
            break;
        }

        case RefreshPanelStatusLoading: {
            [self changedToLoadingStatus];
            break;
        }
    }
}

- (void)changedToIdleStatus {
    self.label.text = @"Idle";
}

- (void)changedToPrepareStatus {
    self.label.text = @"Prepare";
}

- (void)changedToLoadingStatus {
    self.label.text = @"Loading...";
}

@end
