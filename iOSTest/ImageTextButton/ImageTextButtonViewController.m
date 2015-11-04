//
//  ImageTextButtonViewController.m
//  Test
//
//  Created by John Zhao on 9/29/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "ImageTextButtonViewController.h"
#import "UIImageTextButton.h"

@interface ImageTextButtonViewController ()

@property (nonatomic, weak) IBOutlet UIImageTextButton               *button02;

@end

@implementation ImageTextButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.button02 setTitle:@"一键导航" forState:UIControlStateNormal];
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

@end
