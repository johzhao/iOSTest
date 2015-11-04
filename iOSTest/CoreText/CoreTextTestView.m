//
//  CoreTextTestView.m
//  Test
//
//  Created by John Zhao on 10/22/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import <CoreText/CoreText.h>
#import "CoreTextTestView.h"

@implementation CoreTextTestView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {

    [super drawRect:rect];

    CGContextRef context = UIGraphicsGetCurrentContext();

    // Flip the context coordinates in iOS only.
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);

    CGContextSetFontSize(context, 20.0f);

    CGMutablePathRef path = CGPathCreateMutable(); //1
    CGPathAddRect(path, NULL, self.bounds );

//    NSAttributedString* attString = [[NSAttributedString alloc] initWithString:@"Hello core text world!"]; //2
    NSString *string = @"Hello core text world! Hello core text world! Hello core text world!";
    NSRange range = NSMakeRange(0, string.length);
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:20.0f] range:range];

    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString); //3
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);

    CTFrameDraw(frame, context); //4

    CFRelease(frame); //5
    CFRelease(path);
    CFRelease(framesetter);
}

@end
