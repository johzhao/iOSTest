//
//  IZJCarouselProgressView.m
//  iZhiJia
//
//  Created by John Zhao on 8/6/15.
//  Copyright (c) 2015 John Zhao. All rights reserved.
//

#import "IZJCarouselProgressView.h"

@interface IZJCarouselProgressView ()

@property (nonatomic, assign) NSInteger             current;

@end



@implementation IZJCarouselProgressView

- (void)setProgress:(NSInteger)progress {
    if (progress >=0 && progress < self.total && self.current != progress) {
        self.current = progress;
        [self setNeedsDisplay];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat width = 8.0f;
    CGFloat height = 8.0f;
    CGFloat xpos = self.frame.size.width - width - 2.0f;
    CGFloat ypos = self.frame.size.height - height - 10.0f;
    CGRect rectangle;
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (NSInteger i=self.total-1; i>=0; --i) {
        rectangle = CGRectMake(xpos, ypos, width, height);
        if (self.current == i) {
            CGContextSetRGBFillColor(context, 234.0f/255.0f, 87.0f/255.0f, 67.0f/255.0f, 1.0f);
        }
        else {
            CGContextSetRGBFillColor(context, 71.0f/255.0f, 61.0f/255.0f, 64.0f/255.0f, 1.0f);
        }
        CGContextFillEllipseInRect(context, rectangle);

        xpos -= width + 8.0f;
    }
}

@end
