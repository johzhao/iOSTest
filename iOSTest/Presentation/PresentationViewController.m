//
//  PresentationViewController.m
//  Test
//
//  Created by John Zhao on 9/21/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "PresentationViewController.h"
#import "ModalViewController.h"

@interface PresentationViewController ()

- (UIViewController*)createModalViewController;

- (IBAction)showViewController:(id)sender;

@end

@implementation PresentationViewController

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

#pragma mark -

- (UIViewController*)createModalViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PresentationViewController" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ModalViewController"];
    return vc;
}

- (IBAction)showViewController:(id)sender {
    UIViewController *vc = [self createModalViewController];
//    vc.modalPresentationStyle = UIModalPresentationPopover;
//    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    [self presentViewController:vc animated:YES completion:nil];

    UIViewController *rootviewcontroller = [UIApplication sharedApplication].delegate.window.rootViewController;
    [rootviewcontroller addChildViewController:vc];
    vc.view.frame = rootviewcontroller.view.bounds;
    [rootviewcontroller.view addSubview:vc.view];
    [vc didMoveToParentViewController:rootviewcontroller];
}

@end
