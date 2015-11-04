//
//  TestAccessoryView.m
//  Test
//
//  Created by John Zhao on 10/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "TestAccessoryView.h"

@interface TestAccessoryView ()

@property (nonatomic, strong) UIButton              *button;
@property (nonatomic, strong) UILabel               *label;

@end



@implementation TestAccessoryView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setImage:[UIImage imageNamed:@"car_door_lock"] forState:UIControlStateNormal];
        [self addSubview:_button];

        _label = [[UILabel alloc] initWithFrame:frame];
        _label.font = [UIFont systemFontOfSize:10.0f];
        _label.textColor = [UIColor blackColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];

        [self updateCount];
    }
    return self;
}

- (void)layoutSubviews {
    self.button.frame = self.bounds;

    CGSize size = [self.label sizeThatFits:self.bounds.size];
    CGFloat ypos = self.bounds.size.height - size.height;
    self.label.frame = CGRectMake(0.0f, ypos, self.bounds.size.width, size.height);
}

- (void)setCount:(NSUInteger)count {
    _count = count;
    [self updateCount];
}

- (void)addTarget:(id)target action:(SEL)action {
    [self.button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateCount {
    NSString *countString = [NSString stringWithFormat:@"%ld", (unsigned long)self.count];
    self.label.text = countString;
}

@end
