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
@property (nonatomic, assign) UIEdgeInsets                          defaultEdgeInsets;

@end



@implementation BottomRefreshTableView

- (void)awakeFromNib {
    [self createRefreshPanel];

    self.backgroundColor = [UIColor lightGrayColor];

    self.delegate = self;
}

- (void)viewDidAppear {
    self.defaultEdgeInsets = self.contentInset;

    if ([self isDisplayingRefreshPanel]) {
        [self requestForUpdate];
    }
}

- (void)createRefreshPanel {
    if (self.refreshPanel == nil) {
        self.refreshPanelHeight = 100.0f;

        CGRect rect = CGRectMake(0.0f, self.contentSize.height, self.bounds.size.width, self.refreshPanelHeight);
        TableViewRefreshPanel *refreshPanel = [[TableViewRefreshPanel alloc] initWithFrame:rect];
        refreshPanel.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:refreshPanel];
        self.refreshPanel = refreshPanel;
        self.refreshPanel.status = RefreshPanelStatusIdle;
    }
}

- (void)endUpdates {
    [super endUpdates];

    self.contentInset = self.defaultEdgeInsets;
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
    if (currentBottomY > refreshPanelBottom + 10.0f) {
        result = YES;
    }
    return result;
}

- (void)requestForUpdate {
    self.refreshPanel.status = RefreshPanelStatusLoading;
    [self.updateDataDelegate tableViewRequestToUpdateData:self];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self.delegate tableView:self didSelectRowAtIndexPath:indexPath];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.refreshPanel.status == RefreshPanelStatusIdle && [self isDisplayingRefreshPanel]) {
        self.refreshPanel.status = RefreshPanelStatusPrepareLoading;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if ([self isDisplayingRefreshPanel]) {
        self.contentInset = UIEdgeInsetsMake(self.defaultEdgeInsets.top, 0.0f, self.refreshPanelHeight, 0.0f);
        [self requestForUpdate];
    }
}

@end
