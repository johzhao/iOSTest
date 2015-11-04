//
//  IZJCarouselProgressView.h
//  iZhiJia
//
//  Created by John Zhao on 8/6/15.
//  Copyright (c) 2015 John Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IZJCarouselProgressView : UIView

@property (nonatomic, assign) NSInteger         total;

- (void)setProgress:(NSInteger)progress;

@end
