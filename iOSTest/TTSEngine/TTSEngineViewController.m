//
//  TTSEngineViewController.m
//  Test
//
//  Created by John Zhao on 9/21/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "TTSEngineViewController.h"

@interface TTSEngineViewController ()

@property (weak, nonatomic) IBOutlet UITextField *stringTextField;
@property (weak, nonatomic) IBOutlet UITextField *languageTextField;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

- (void)setSpeed:(CGFloat)speed;

- (IBAction)speedValueChanged:(id)sender;
- (IBAction)englishPressed:(id)sender;
- (IBAction)chinesePressed:(id)sender;
- (IBAction)playPressed:(id)sender;

@end

@implementation TTSEngineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self englishPressed:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)setSpeed:(CGFloat)speed {
    [self.speedSlider setValue:speed animated:YES];
    [self speedValueChanged:self.speedSlider];
}

- (IBAction)speedValueChanged:(id)sender {
    CGFloat speed = self.speedSlider.value;
    self.speedLabel.text = [NSString stringWithFormat:@"%.02f", speed];
}

- (IBAction)englishPressed:(id)sender {
    self.stringTextField.text = @"Turn right at the next maneuver.";
    self.languageTextField.text = @"en-US";
    [self setSpeed:0.5f];
}

- (IBAction)chinesePressed:(id)sender {
    self.stringTextField.text = @"下一个路口右转";
    self.languageTextField.text = @"zh-CN";
    [self setSpeed:0.5f];
}

- (IBAction)playPressed:(id)sender {
    AVSpeechSynthesizer* synthesizer = [[AVSpeechSynthesizer alloc] init];
    AVSpeechUtterance* utterance = [AVSpeechUtterance speechUtteranceWithString:self.stringTextField.text];
    utterance.rate = self.speedSlider.value;
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:self.languageTextField.text];
    [synthesizer speakUtterance:utterance];
}

@end
