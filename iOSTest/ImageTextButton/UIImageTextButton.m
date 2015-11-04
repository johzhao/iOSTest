//
//  UIImageTextButton.m
//  Test
//
//  Created by John Zhao on 9/29/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "UIImageTextButton.h"

@implementation UIImageTextButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;

        self.titleLabel.layer.borderWidth = 1.0f;
        self.titleLabel.layer.borderColor = [UIColor redColor].CGColor;
    }
    return self;
}

- (void)awakeFromNib {
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;

    self.titleLabel.layer.borderWidth = 1.0f;
    self.titleLabel.layer.borderColor = [UIColor redColor].CGColor;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
//    [self updateFrame];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
//    [self updateFrame];
}

//- (void)updateFrame {
//    CGSize size = self.imageView.image.size;
//    CGRect frame = self.frame;
//    frame.size = size;
//    self.frame = frame;
//}

//- (CGSize)sizeThatFits:(CGSize)size {
//    return self.imageView.image.size;
//}

//- (void)sizeToFit {
//    [self updateFrame];
//}

//- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize {
//    return self.imageView.image.size;
//}

//- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority {
//    return self.imageView.image.size;
//}

- (void)layoutSubviews {
    [super layoutSubviews];

    UILabel *label = self.titleLabel;
    label.textAlignment = NSTextAlignmentCenter;
    CGSize size = [label sizeThatFits:self.bounds.size];

    CGFloat xpos = 0.0f;
    CGFloat ypos = self.bounds.size.height - size.height - 3.0f;
    CGFloat width = self.bounds.size.width;
    CGFloat height = size.height;
    label.frame = CGRectMake(xpos, ypos, width, height);

    UIImageView *imageview = self.imageView;
    imageview.contentMode = UIViewContentModeCenter;
    static CGFloat ImageEdge = 5.0f;
    xpos = ImageEdge;
    ypos = ImageEdge;
    width = self.bounds.size.width - ImageEdge - ImageEdge;
    height = label.frame.origin.y - ImageEdge - ImageEdge;
    imageview.frame = CGRectMake(xpos, ypos, width, height);
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//
//    UIImageView *imageview = self.imageView;
//    imageview.contentMode = UIViewContentModeCenter;
//    imageview.frame = self.bounds;
//
//    UILabel *label = self.titleLabel;
//    label.font = [UIFont systemFontOfSize:14.0f];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.numberOfLines = 0;
//    label.textColor = [UIColor redColor];
//
//    CGFloat xpos = self.bounds.size.width - 25.0f;
//    CGFloat ypos = 0.0f;
//    CGFloat width = self.bounds.size.width - xpos;
//    CGFloat height = self.bounds.size.height;
//    label.frame = CGRectMake(xpos, ypos, width, height);
//}

@end
