//
//  SoundPlayer.h
//  Test
//
//  Created by John Zhao on 10/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundPlayer : NSObject

- (BOOL)isPlaying;

- (void)play:(NSURL*)url;

- (BOOL)isRecording;

- (void)recordto:(NSURL*)url;

- (void)stop;

@end
