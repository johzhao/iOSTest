//
//  AccessoryTableViewCell.m
//  Test
//
//  Created by John Zhao on 10/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "AccessoryTableViewCell.h"
#import "TestAccessoryView.h"

@interface AccessoryTableViewCell ()

@property (nonatomic, strong) TestAccessoryView                 *testAccessoryView;
@property (nonatomic, weak) IBOutlet UILabel                    *label;
@property (nonatomic, weak) IBOutlet UIButton                   *button;

@end



@implementation AccessoryTableViewCell

- (void)awakeFromNib {
    // Initialization code

    self.testAccessoryView = [[TestAccessoryView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 45.0f, self.bounds.size.height)];
    [self.testAccessoryView addTarget:self action:@selector(accessoryViewPressed:)];
    self.testAccessoryView.count = self.num;
    self.accessoryView = self.testAccessoryView;

    self.label.text = self.text;
}

- (IBAction)buttonPressed:(id)sender {
    NSLog(@"Button %ld pressed", (long)self.num);
}

- (void)accessoryViewPressed:(id)sender {
    NSLog(@"Accessory %ld pressed", (long)self.num);
}

- (void)setNum:(NSInteger)num {
    _num = num;

    self.testAccessoryView.count = num;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
