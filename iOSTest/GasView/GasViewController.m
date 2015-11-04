//
//  GasViewController.m
//  Test
//
//  Created by John Zhao on 9/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "GasViewController.h"

@interface GasViewController ()

@property (nonatomic, weak) IBOutlet UISlider                   *slider;
@property (weak, nonatomic) IBOutlet UILabel                    *valueLabel;
@property (nonatomic, weak) IBOutlet UIImageView                *indicator;
@property (nonatomic, weak) IBOutlet UIImageView                *plate;

- (IBAction)slideValueChanged:(id)sender;

- (void)setIndicatorValue:(CGFloat)value;

@end

@implementation GasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.slider.value = 0.0f;
    CGFloat posx = 75.0f/self.indicator.bounds.size.width;
    self.indicator.layer.anchorPoint = CGPointMake(posx, 0.5f);
    [self setIndicatorValue:0.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)slideValueChanged:(id)sender {
    UISlider *slider = (UISlider*)sender;
    CGFloat value = slider.value;
    [self setIndicatorValue:value];
}

- (void)setIndicatorValue:(CGFloat)value {
    NSString *string = [NSString stringWithFormat:@"%.02f", value];
    self.valueLabel.text = string;

    self.indicator.transform = CGAffineTransformMakeRotation(M_PI * value);
}

@end
