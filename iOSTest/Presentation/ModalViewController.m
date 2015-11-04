//
//  ModalViewController.m
//  Test
//
//  Created by John Zhao on 9/21/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

- (IBAction)dismissPressed:(id)sender;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)dismissPressed:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self didMoveToParentViewController:nil];
}

@end
