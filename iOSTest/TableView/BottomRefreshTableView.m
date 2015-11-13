//
//  BottomRefreshTableView.m
//  Test
//
//  Created by John Zhao on 10/26/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "BottomRefreshTableView.h"
#import "TableViewRefreshPanel.h"

@interface BottomRefreshTableView () <UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, assign) CGFloat                               refreshPanelHeight;
@property (nonatomic, weak) TableViewRefreshPanel                   *refreshPanel;

@end



@implementation BottomRefreshTableView

- (void)awakeFromNib {
    self.backgroundColor = [UIColor lightGrayColor];
    [self createRefreshPanel];
    self.delegate = self;
}

- (void)viewDidAppear {
    if ([self isDisplayingRefreshPanel]) {
        [self requestForUpdate];
    }
}

- (void)createRefreshPanel {
    if (self.refreshPanel == nil) {
        self.refreshPanelHeight = 100.0f;
        CGRect rect = CGRectMake(0.0f, self.contentSize.height, self.bounds.size.width, self.refreshPanelHeight);
        TableViewRefreshPanel *refreshPanel = [[TableViewRefreshPanel alloc] initWithFrame:rect];
        refreshPanel.backgroundColor = self.backgroundColor;
        [self addSubview:refreshPanel];
        self.refreshPanel = refreshPanel;
        self.refreshPanel.status = RefreshPanelStatusIdle;
    }
}

- (void)endUpdates {
    [super endUpdates];

    self.contentInset = UIEdgeInsetsZero;
    self.refreshPanel.status = RefreshPanelStatusIdle;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGRect rect = CGRectMake(0.0f, self.contentSize.height, self.bounds.size.width, self.refreshPanelHeight);
    self.refreshPanel.frame = rect;
}

- (BOOL)isDisplayingRefreshPanel {
    BOOL result = NO;
    CGFloat currentBottomY = self.contentOffset.y + self.bounds.size.height;
    CGFloat refreshPanelBottom = self.contentSize.height + self.refreshPanel.bounds.size.height;
    if (currentBottomY >= refreshPanelBottom) {
        result = YES;
    }
    return result;
}

- (void)requestForUpdate {
    self.refreshPanel.status = RefreshPanelStatusLoading;
    [self.updateDataSource tableViewRequestToUpdateData:self];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableViewDelegate tableView:self didSelectRowAtIndexPath:indexPath];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.refreshPanel.status == RefreshPanelStatusIdle && [self isDisplayingRefreshPanel]) {
        self.refreshPanel.status = RefreshPanelStatusPrepareLoading;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([self isDisplayingRefreshPanel]) {
        self.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, self.refreshPanelHeight, 0.0f);
        [self requestForUpdate];
    }
}

@end
