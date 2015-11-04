//
//  PopoverTestViewController.m
//  Test
//
//  Created by John Zhao on 10/26/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "PopoverTestViewController.h"

@interface PopoverTestViewController () <UIPopoverPresentationControllerDelegate>

@property (nonatomic, weak) UIBarButtonItem                     *buttonItem;
@property (nonatomic, weak) IBOutlet UIButton                   *button;

@end

@implementation PopoverTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
//                                                                                 target:self
//                                                                                 action:@selector(buttonItemPressed:)];
//    self.navigationItem.rightBarButtonItem = rightButton;
//    self.buttonItem = rightButton;

    self.modalPresentationStyle = UIModalPresentationPopover;
    self.popoverPresentationController.delegate = self;
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

- (IBAction)buttonItemPressed:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PopoverTestViewController" bundle:nil];
//    PopoverTestViewController *vc = [storyboard instantiateInitialViewController];

//    UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:vc];
//    [popover presentPopoverFromBarButtonItem:self.buttonItem permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (IBAction)buttonPressed:(id)sender {
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PopoverTestViewController" bundle:nil];
//    PopoverTestViewController *vc = [storyboard instantiateInitialViewController];
//
//    vc.popoverPresentationController.sourceView = self.button; //The view containing the anchor rectangle for the popover.
//    vc.popoverPresentationController.sourceRect = self.button.bounds; //The rectangle in the specified view in which to anchor the popover.
//    vc.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
//    vc.preferredContentSize = CGSizeMake(100, 50);
//    [self presentViewController:vc animated:YES completion:nil];
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone; //You have to specify this particular value in order to make it work on iPhone.
}

#pragma mark - UIPopoverPresentationControllerDelegate

- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController {
    self.popoverPresentationController.sourceView = self.button;
    self.popoverPresentationController.sourceRect = self.button.bounds;
    self.preferredContentSize = CGSizeMake(100, 50);

    popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
//    popoverPresentationController.passthroughViews = self.passthroughViews;
//    popoverPresentationController.backgroundColor = self.backgroundColor;
//    popoverPresentationController.popoverLayoutMargins = self.popoverLayoutMargins;
}

- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView *__autoreleasing *)view {
//    if ([self.delegate respondsToSelector:@selector(popoverPresentationController:willRepositionPopoverToRect:inView:)]) {
//        [self.delegate popoverPresentationController:popoverPresentationController willRepositionPopoverToRect:rect inView:view];
//    }
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
//    if ([self.delegate respondsToSelector:@selector(popoverPresentationControllerShouldDismissPopover:)]) {
//        return [self.delegate popoverPresentationControllerShouldDismissPopover:popoverPresentationController];
//    }

    return YES;
}

- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController {
//    if ([self.delegate respondsToSelector:@selector(popoverPresentationControllerDidDismissPopover:)]) {
//        [self.delegate popoverPresentationControllerDidDismissPopover:popoverPresentationController];
//    }
}

@end
