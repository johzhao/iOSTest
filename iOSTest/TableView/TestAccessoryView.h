//
//  TestAccessoryView.h
//  Test
//
//  Created by John Zhao on 10/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAccessoryView : UIView

@property (nonatomic, assign) NSUInteger                count;

- (void)addTarget:(id)target action:(SEL)action;

@end
