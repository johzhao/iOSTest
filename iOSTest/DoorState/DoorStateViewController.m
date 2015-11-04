//
//  DoorStateViewController.m
//  Test
//
//  Created by John Zhao on 10/12/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "DoorStateViewController.h"
#import "DoorStateTestViewController.h"

@interface DoorStateViewController ()

@property (nonatomic, weak) IBOutlet UILabel            *leftFront;
@property (nonatomic, weak) IBOutlet UILabel            *rightFront;
@property (nonatomic, weak) IBOutlet UILabel            *leftRear;
@property (nonatomic, weak) IBOutlet UILabel            *rightRear;
@property (nonatomic, weak) IBOutlet UILabel            *rear;

- (IBAction)buttonPressed:(id)sender;

@end

@implementation DoorStateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.leftFront.layer.borderWidth = 1.0f;
    self.leftFront.layer.borderColor = [UIColor redColor].CGColor;
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

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Button pressed.");

    DoorStateTestViewController *vc = [[DoorStateTestViewController alloc] initWithNibName:@"DoorStateTestViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
