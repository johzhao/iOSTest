//
//  AttributeStringViewController.m
//  Test
//
//  Created by John Zhao on 9/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "AttributeStringViewController.h"

@interface AttributeStringViewController ()

@property (nonatomic, weak) IBOutlet UILabel                *label1;
@property (nonatomic, weak) IBOutlet UILabel                *label2;
@property (nonatomic, weak) IBOutlet UILabel                *label3;
@property (nonatomic, weak) IBOutlet UILabel                *label4;
@property (nonatomic, weak) IBOutlet UILabel                *label5;
@property (nonatomic, weak) IBOutlet UILabel                *label6;

@end

@implementation AttributeStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // Setup the attribute string by multi addAttribute:value:range: call.
    {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Hellow World, Programming In Objective-C."];
        NSRange range = NSMakeRange(0, string.length);

        // Font
        [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:30.0f] range:range];

        // Foreground color
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];

        // Background color
        [string addAttribute:NSBackgroundColorAttributeName value:[UIColor grayColor] range:range];

        // Underline
        [string addAttribute:NSUnderlineStyleAttributeName value:@1 range:range];

        // Distance
        [string addAttribute:NSKernAttributeName value:@0 range:range];

        // Shadow
//        NSShadow *shadowDic = [[NSShadow alloc] init];
//        [shadowDic setShadowBlurRadius:3.0f];
//        [shadowDic setShadowColor:[UIColor blackColor]];
//        [shadowDic setShadowOffset:CGSizeMake(3.0f, 3.0f)];
//        [string addAttribute:NSShadowAttributeName value:shadowDic range:range];

        // Stroke color
        [string addAttribute:NSStrokeColorAttributeName value:[UIColor greenColor] range:range];

        // Stroke attributes
        [string addAttribute:NSStrokeWidthAttributeName value:@-2.0f range:range];

        self.label1.attributedText = string;
    }

    // Add attribute by attribute dictionary
    {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Hello World, Programming In Objective-C"];
        NSDictionary *dict = @{
                               NSFontAttributeName : [UIFont boldSystemFontOfSize:15.0f],
                               NSForegroundColorAttributeName : [UIColor greenColor],
                               };
        [string addAttributes:dict range:NSMakeRange(0, string.length)];

        self.label2.attributedText = string;
    }

    // Use different foreground color to display
    {
        NSDictionary *wordToColorMapping = @{
                                             @"Hello World, " : [UIColor redColor],
                                             @"Programing In " : [UIColor greenColor],
                                             @"Objective-C" : [UIColor blueColor]
                                             };
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@""];
        for (NSString *word in wordToColorMapping) {
            // TODO: The word order was reversed.
            UIColor *color = wordToColorMapping[word];
            NSDictionary *attribute = @{NSForegroundColorAttributeName : color};
            NSAttributedString *subString = [[NSAttributedString alloc] initWithString:word attributes:attribute];
            [string appendAttributedString:subString];
        }

        self.label3.attributedText = string;
    }

    // Use differnt font to display
    {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"H2O"];
        NSDictionary *dict1 = @{
                                NSFontAttributeName : [UIFont boldSystemFontOfSize:20.0f],
                                NSForegroundColorAttributeName : [UIColor blackColor],
                                };
        NSDictionary *dict2 = @{
                                NSFontAttributeName : [UIFont boldSystemFontOfSize:10.0f],
                                NSForegroundColorAttributeName : [UIColor redColor],
                                };
        [string setAttributes:dict1 range:NSMakeRange(0, 1)];
        [string setAttributes:dict2 range:NSMakeRange(1, 1)];
        [string setAttributes:dict1 range:NSMakeRange(2, 1)];

        self.label4.attributedText = string;
    }

    // Add image
    {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Contacts _*_ Contacts"];

        // Create the text attachment and set the image
        UIImage *image = [UIImage imageNamed:@"contact"];
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
        textAttachment.image = image;

        // Create the attribute string with the text attachment
        NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];

        // Replace the _*_ part by image.
        // TODO: Should get range by search the "_*_"
        [string replaceCharactersInRange:NSMakeRange(9, 3) withAttributedString:attachmentString];

        // Set baseline of the first part of string
        [string addAttribute:NSBaselineOffsetAttributeName value:@13 range:NSMakeRange(0, 8)];

        self.label5.attributedText = string;
    }

    {
        // Create the text attachment and set the image
        UIImage *image = [UIImage imageNamed:@"location"];
        NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
        textAttachment.image = image;

        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
        [string appendAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment]];

        NSString *str = @"天津市";
        [string appendAttributedString:[[NSAttributedString alloc] initWithString:str]];

         self.label6.attributedText = string;
    }
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
