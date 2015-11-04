//
//  IZJCarouselView.m
//  iZhiJia
//
//  Created by John Zhao on 11/2/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "IZJCarouselView.h"
#import "IZJCarouselProgressView.h"

@interface IZJCarouselView ()

@property (nonatomic, weak) IBOutlet UIImageView                *imageView;
@property (nonatomic, weak) IBOutlet IZJCarouselProgressView    *progressView;

@property (nonatomic, strong) NSArray                           *imageArray;
@property (nonatomic, assign) NSInteger                         imageIndex;
@property (nonatomic, strong) NSTimer*                          slideTimer;

@end

static const NSTimeInterval AnimationInterval = 2.0;
static const NSTimeInterval AnimationDuration = 0.3;

@implementation IZJCarouselView

- (void)awakeFromNib {
    self.imageIndex = 0;
    self.imageArray = @[
                        [UIImage imageNamed:@"carousel1"],
                        [UIImage imageNamed:@"carousel2"],
                        [UIImage imageNamed:@"carousel3"],
                        [UIImage imageNamed:@"carousel4"],
                        [UIImage imageNamed:@"carousel5"]
                        ];
    self.imageView.image = [self.imageArray objectAtIndex:self.imageIndex];
    self.progressView.total = self.imageArray.count;

    // Start time for slide
    self.slideTimer = [NSTimer scheduledTimerWithTimeInterval:AnimationInterval target:self selector:@selector(slideTimerFired:) userInfo:nil repeats:YES];
}

- (void)dealloc {
    [self.slideTimer invalidate];
    self.slideTimer = nil;
}

- (IBAction)swipeLeft:(id)sender {
    [self beginSwipTransitionWithSubType:kCATransitionFromRight image:[self nextImage]];

    // Reset the timer
    [self.slideTimer invalidate];
    self.slideTimer = nil;
    self.slideTimer = [NSTimer scheduledTimerWithTimeInterval:AnimationInterval target:self selector:@selector(slideTimerFired:) userInfo:nil repeats:YES];
}

- (IBAction)swipeRight:(id)sender {
    [self beginSwipTransitionWithSubType:kCATransitionFromLeft image:[self prevImage]];

    // Reset the timer
    [self.slideTimer invalidate];
    self.slideTimer = nil;
    self.slideTimer = [NSTimer scheduledTimerWithTimeInterval:AnimationInterval target:self selector:@selector(slideTimerFired:) userInfo:nil repeats:YES];
}

- (void)slideTimerFired:(NSTimer*)timer {
    [self beginSwipTransitionWithSubType:kCATransitionFromRight image:[self nextImage]];
}

- (UIImage*)prevImage {
    self.imageIndex -= 1;
    if (self.imageIndex < 0) {
        self.imageIndex = self.imageArray.count - 1;
    }
    return [self.imageArray objectAtIndex:self.imageIndex];
}

- (UIImage*)nextImage {
    self.imageIndex += 1;
    if (self.imageIndex >= (NSInteger)self.imageArray.count) {
        self.imageIndex = 0;
    }
    return [self.imageArray objectAtIndex:self.imageIndex];
}

- (void)beginSwipTransitionWithSubType:(NSString*)subtype image:(UIImage*)image {
    NSString *animationKey = @"KCTransitionAnimation";
    [self.imageView.layer removeAnimationForKey:animationKey];

    CATransition *transition = [[CATransition alloc] init];

    transition.type = kCATransitionPush;
    transition.subtype = subtype;
    transition.duration = AnimationDuration;

    self.imageView.image = image;
    [self.imageView.layer addAnimation:transition forKey:animationKey];
    [self.progressView setProgress:self.imageIndex];
}

@end
