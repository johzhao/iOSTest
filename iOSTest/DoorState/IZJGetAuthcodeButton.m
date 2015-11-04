//
//  IZJGetAuthcodeButton.m
//  iZhiJia
//
//  Created by John Zhao on 10/13/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "IZJGetAuthcodeButton.h"

@interface IZJGetAuthcodeButton ()

@property (nonatomic, strong) NSTimer           *timer;
@property (nonatomic, assign) NSInteger         currentNumber;

@end

@implementation IZJGetAuthcodeButton

- (void)awakeFromNib {
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self setDefaultTitle];
}

- (void)setDefaultTitle {
    [self setTitle:NSLocalizedString(@"login_auth_code_button_title", nil) forState:UIControlStateNormal];
}

- (void)beginCountDown {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];
    self.currentNumber = 10;
}

- (void)finishCountDown {
    [self.timer invalidate];
    self.timer = nil;
    [self setDefaultTitle];
}

- (void)buttonPressed:(id)sender {
    [self beginCountDown];
}

- (void)timerFired:(NSTimer*)timer {
    if (self.currentNumber > 0) {
        NSString *title = [NSString stringWithFormat:NSLocalizedString(@"login_auth_code_button_title_countdown", nil), (long)self.currentNumber];
        [self setTitle:title forState:UIControlStateNormal];
        self.currentNumber -= 1;
    }
    else {
        [self finishCountDown];
    }
}

@end
