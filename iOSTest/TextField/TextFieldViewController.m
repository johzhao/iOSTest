//
//  TextFieldViewController.m
//  Test
//
//  Created by John Zhao on 10/16/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <CoreText/CoreText.h>
#import "TextFieldViewController.h"

@interface TextFieldViewController ()

@property (nonatomic, weak) IBOutlet UITextField            *textField1;
@property (nonatomic, weak) IBOutlet UITextField            *textField2;
@property (nonatomic, weak) IBOutlet UITextField            *textField3;
@property (nonatomic, weak) IBOutlet UIImageView            *imageView;

@property (nonatomic, strong) UIView                        *inputView;
@property (nonatomic, strong) UIView                        *inputAccessoryView;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.inputView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 20.0f)];
    self.inputView.backgroundColor = [UIColor redColor];
    self.inputView.alpha = 0.3f;

    self.inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 50.0f)];
    self.inputAccessoryView.backgroundColor = [UIColor greenColor];
    self.inputAccessoryView.alpha = 0.3f;

    self.textField1.inputView = self.inputView;
    self.textField2.inputView = self.inputView;
    self.textField3.inputView = self.inputView;

    self.textField1.inputAccessoryView = self.inputAccessoryView;
    self.textField2.inputAccessoryView = self.inputAccessoryView;
    self.textField3.inputAccessoryView = self.inputAccessoryView;

    self.imageView.image = [self numberToImage:9];
}

- (void)viewDidAppear:(BOOL)animated {
    UILabel *label = [self addLabelWithNumber:8];
    CGRect imageRect = self.imageView.frame;
    imageRect.origin.x = imageRect.origin.x + imageRect.size.width + 8.0f;
    label.frame = imageRect;
    [self.view addSubview:label];

    label.layer.cornerRadius = imageRect.size.height / 2.0f;
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

- (UILabel*)addLabelWithNumber:(NSInteger)number {
    NSString *string = [NSString stringWithFormat:@"%ld", (long)number];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = NSMakeRange(0, string.length);
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:10.0f] range:range];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.attributedText = attString;
    label.backgroundColor = [UIColor whiteColor];

    return label;
}

- (UIImage*)numberToImage:(NSInteger)number {

    UIImage *image = nil;
    CGRect rect = self.imageView.bounds;
    NSString *string = [NSString stringWithFormat:@"%ld", (long)number];
    NSRange range = NSMakeRange(0, string.length);
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:10.0f] range:range];

    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [attString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, rect);

    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillEllipseInRect(context, self.imageView.bounds);

    // TODO: Draw text in the rect.

    // Set the text matrix.
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);

    // Flip the context coordinates in iOS only.
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);

    // Create the framesetter with the attributed string.
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);

    // Create a frame for this path and draw the text.
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);
    CTFrameDraw(frame, context);

    CFRelease(frame);
    CFRelease(framesetter);
    CFRelease(path);

    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
