//
//  ChatMessageViewCell.h
//  Test
//
//  Created by John Zhao on 10/29/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChatMessageEntity;

@interface ChatMessageViewCell : UITableViewCell

@property (nonatomic, strong) ChatMessageEntity                 *chatEntity;

+ (CGFloat)calculateCellHeightWithEntity:(ChatMessageEntity*)entity width:(CGFloat)width;

@end
