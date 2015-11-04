//
//  ChatMessageViewCell.m
//  Test
//
//  Created by John Zhao on 10/29/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "ChatMessageViewCell.h"
#import "ChatEntity.h"

@interface ChatMessageViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView                    *headerImageView;
@property (nonatomic, weak) IBOutlet UIView                         *containerView;
@property (nonatomic, weak) IBOutlet UIImageView                    *messageBkImageView;
@property (nonatomic, weak) IBOutlet UILabel                        *messageLabel;

@end



@implementation ChatMessageViewCell

- (void)setChatEntity:(ChatMessageEntity*)entity {
    _chatEntity = entity;

    self.headerImageView.image = entity.sender.image;
    self.messageLabel.text = entity.message;
}

+ (CGFloat)calculateCellHeightWithEntity:(ChatMessageEntity*)entity width:(CGFloat)width {
    CGFloat messageBkWidth = width * 0.7;
    CGRect rect = [entity.message boundingRectWithSize:CGSizeMake(messageBkWidth, 1000.0f)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17.0f]}
                                               context:nil];
    return rect.size.height + 40.0f;
}

@end
