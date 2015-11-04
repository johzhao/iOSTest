//
//  SegmentView.m
//  Test
//
//  Created by John Zhao on 9/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "SegmentView.h"

@interface UIImageView (Segment)

- (void)setSegmentValue:(NSInteger)value;

@end

@implementation UIImageView (Segment)

- (void)setSegmentValue:(NSInteger)value {
    NSString *imageName = [NSString stringWithFormat:@"num_%ld", (long)value];
    self.image = [UIImage imageNamed:imageName];
}

@end

@interface SegmentView ()

@property (nonatomic, weak) IBOutlet UIImageView        *image0;
@property (nonatomic, weak) IBOutlet UIImageView        *image1;
@property (nonatomic, weak) IBOutlet UIImageView        *image2;
@property (nonatomic, weak) IBOutlet UIImageView        *image3;
@property (nonatomic, weak) IBOutlet UIImageView        *image4;
@property (nonatomic, weak) IBOutlet UIImageView        *image5;
@property (nonatomic, weak) IBOutlet UIImageView        *image6;
@property (nonatomic, weak) IBOutlet UIImageView        *image7;

@property (nonatomic, strong) NSArray                   *imageArray;

@end

@implementation SegmentView

- (void)awakeFromNib {
    [super awakeFromNib];

    self.imageArray = @[self.image0, self.image1, self.image2, self.image3, self.image4, self.image5, self.image6, self.image7];
    [self setSegmentValue:0];
}

- (void)setSegmentValue:(NSInteger)value {
    NSInteger position = 1;
    for (UIImageView *imageView in self.imageArray) {
        [imageView setSegmentValue:((value / position) % 10)];
        position *= 10;
    }
}

@end
