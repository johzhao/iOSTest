//
//  DiskButtonsViewController.m
//  Test
//
//  Created by John Zhao on 9/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "DiskButtonsViewController.h"
#import "MLButton/MLButton.h"

@interface DiskButtonsViewController ()

@property (weak, nonatomic) IBOutlet UILabel    *infoLabel;
@property (weak, nonatomic) UIButton            *selectedButton;

- (IBAction)carCheckPressed:(id)sender;
- (IBAction)carInfoPressed:(id)sender;
- (IBAction)carLimitPressed:(id)sender;
- (IBAction)carLocationPressed:(id)sender;
- (IBAction)centerPressed:(id)sender;
- (IBAction)dirvingReportPressed:(id)sender;
- (IBAction)remoteControlPressed:(id)sender;

@end

@implementation DiskButtonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.infoLabel.text = @"";
    self.selectedButton = nil;
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

- (IBAction)carCheckPressed:(id)sender {
    [self changeHighlightedButtonTo:sender];
    self.infoLabel.text = @"Car Check";
}

- (IBAction)carInfoPressed:(id)sender {
    [self changeHighlightedButtonTo:sender];
    self.infoLabel.text = @"Car Info";
}

- (IBAction)carLimitPressed:(id)sender {
    [self changeHighlightedButtonTo:sender];
    self.infoLabel.text = @"Car Limit";
}

- (IBAction)carLocationPressed:(id)sender {
    [self changeHighlightedButtonTo:sender];
    self.infoLabel.text = @"Car Location";
}

- (IBAction)centerPressed:(id)sender {
    [self changeHighlightedButtonTo:sender];
    self.infoLabel.text = @"Center";
}

- (IBAction)dirvingReportPressed:(id)sender {
    [self changeHighlightedButtonTo:sender];
    self.infoLabel.text = @"Driving Report";
}

- (IBAction)remoteControlPressed:(id)sender {
    [self changeHighlightedButtonTo:sender];
    self.infoLabel.text = @"Remote Control";
}

- (void)changeHighlightedButtonTo:(UIButton*)button {
    if (self.selectedButton != button) {
        self.selectedButton.selected = NO;
        self.selectedButton = button;
        self.selectedButton.selected = YES;
    }
}

@end
