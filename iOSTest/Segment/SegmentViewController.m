//
//  SegmentViewController.m
//  Test
//
//  Created by John Zhao on 9/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "SegmentViewController.h"
#import "SegmentView.h"

@interface SegmentViewController ()

@property (nonatomic, weak) IBOutlet SegmentView                *segmentView;

- (IBAction)randomPressed:(id)sender;

@end

@implementation SegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.segmentView setSegmentValue:880];
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

- (IBAction)randomPressed:(id)sender {

}

@end
