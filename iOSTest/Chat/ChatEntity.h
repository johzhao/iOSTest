//
//  ChatEntity.h
//  Test
//
//  Created by John Zhao on 10/29/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sender : NSObject

@property (nonatomic, strong) UIImage                   *image;
@property (nonatomic, copy) NSString                    *name;

@end



@interface ChatEntity : NSObject

@property (nonatomic, strong) Sender                    *sender;
@property (nonatomic, assign) BOOL                      received;

@end



@interface ChatMessageEntity : ChatEntity

@property (nonatomic, copy) NSString                    *message;

@end
