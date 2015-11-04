//
//  TextKitViewController.m
//  Test
//
//  Created by John Zhao on 9/23/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "TextKitViewController.h"

@interface TextKitViewController () <NSLayoutManagerDelegate>

@property (nonatomic, weak) IBOutlet UITextView             *textView01;

@property (nonatomic, strong) UITextView                    *textView02;

@end

@implementation TextKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.textView01.text = @"We’ve reimagined the TV experience with tvOS — an innovative TV platform that redefines what can be done in the living room. With tvOS, the new Apple TV is more entertaining than ever featuring a built-in App Store. Now you can deliver incredible and immersive apps and games on the big screen using the tvOS SDK.";

    self.textView01.layoutManager.delegate = self;
    {
//        self.textView01.scrollEnabled = NO;
//
//        NSTextStorage *storage = self.textView01.textStorage;
//        NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
//        [storage addLayoutManager:layoutManager];
//
//        NSTextContainer *textContainer = [[NSTextContainer alloc] init];
//        [layoutManager addTextContainer:textContainer];
//
//        CGRect frame = self.textView01.bounds;
//        CGPoint topleft = frame.origin;
//        topleft.y += frame.size.height + 310.0f;
//        frame.origin = topleft;
//        self.textView02 = [[UITextView alloc] initWithFrame:frame textContainer:textContainer];
//        self.textView02.backgroundColor = [UIColor greenColor];
//        [self.view addSubview:self.textView02];
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

#pragma mark -
#pragma mark NSLayoutManagerDelegate

- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect {
//    return floorf(glyphIndex / 100);
    return 10.0f;
}

@end
