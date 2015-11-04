//
//  SoundPlayer.m
//  Test
//
//  Created by John Zhao on 10/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "SoundPlayer.h"

@interface SoundPlayer ()

@property (nonatomic, strong) AVAudioSession                        *session;
@property (nonatomic, strong) AVAudioPlayer                         *player;
@property (nonatomic, strong) AVAudioRecorder                       *recorder;

@end



@implementation SoundPlayer

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        // Initialize and active the audio session
        NSError *error = nil;
        AVAudioSession *session = [AVAudioSession sharedInstance];
        BOOL success = [session setActive:YES error:&error];
        if (success) {
            _session = session;
        }
        else {
            self = nil;
        }

    }
    return self;
}

- (BOOL)isPlaying {
    return NO;
}

- (void)play:(NSURL*)url {
    NSError *error = nil;
    BOOL success = [self.session setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    if (!success) {
        // Handle error.
    }

    success = [self.session setMode:AVAudioSessionModeVoiceChat error:&error];
    if (!success) {
        // Handle error.
    }

    if ([self isPlaying]) {
        // Is playing
    }

    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
    self.player.numberOfLoops = 0;
    self.player.volume = 0.5f;
}

- (BOOL)isRecording {
    return NO;
}

- (void)recordto:(NSURL*)url {

}

- (void)stop {

}

@end
