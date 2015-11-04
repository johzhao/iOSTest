//
//  WebViewController.m
//  Test
//
//  Created by John Zhao on 10/22/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@property (nonatomic, weak) IBOutlet UIWebView                  *webview;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *docArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filenameString = [docArray objectAtIndex:0];
    filenameString = [filenameString stringByAppendingPathComponent:@"folder"];
    filenameString = [filenameString stringByAppendingPathComponent:@"autohome.html"];

    NSURL *url = [NSURL fileURLWithPath:filenameString isDirectory:NO];
    [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
}

#pragma mark - UIWebViewDelegate

@end
