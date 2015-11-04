//
//  ScrollViewController.m
//  Test
//
//  Created by John Zhao on 10/30/15.
//  Copyright © 2015 John Zhao. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView                   *scrollView;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;

    UIBarButtonItem* rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                 target:self
                                                                                 action:@selector(navBtnPressed:)];
    self.navigationItem.rightBarButtonItem = rightButton;

//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.scrollView.contentInset = UIEdgeInsetsZero;

//    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 2.0);

    CGFloat xpos = 0.0f;
    CGFloat ypos = 0.0f;
    CGFloat width = self.view.bounds.size.width;
    CGFloat bottom = 0.0f;
    {
        UIImage *image = [UIImage imageNamed:@"carousel1"];
        CGFloat imageViewHeight = image.size.height * width / image.size.width;
        CGRect rect = CGRectMake(xpos, ypos, width, imageViewHeight);
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = rect;
        [self.scrollView addSubview:imageView];

        bottom += imageViewHeight;
    }

    {
        ypos = bottom;

        CGRect rect = CGRectMake(xpos, ypos, width, 30.0f);
        UIView *v = [[UIView alloc] initWithFrame:rect];
        v.backgroundColor = [UIColor magentaColor];
        [self.scrollView addSubview:v];

        bottom += v.bounds.size.height;
    }

    {
        ypos = bottom;
        CGRect rect = CGRectMake(xpos, ypos, width, 70.0f);
        UIView *v = [[UIView alloc] initWithFrame:rect];
        v.backgroundColor = [UIColor darkGrayColor];
        [self.scrollView addSubview:v];

        bottom += v.bounds.size.height;
    }

    {
        ypos = bottom;
        CGRect rect = CGRectMake(xpos, ypos, width, 200.0f);
        UIView *v = [[UIView alloc] initWithFrame:rect];
        v.backgroundColor = [UIColor lightGrayColor];
        [self.scrollView addSubview:v];

        bottom += v.bounds.size.height;
    }

    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, bottom);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CGSize contentSize = self.scrollView.contentSize;
    NSLog(@"Bound = %@, Size = %@", NSStringFromCGRect(self.scrollView.bounds), NSStringFromCGSize(contentSize));

    [self.navigationController setToolbarHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.navigationController setToolbarHidden:YES];
}

- (void)navBtnPressed:(id)sender {
    UIEdgeInsets edge = self.scrollView.contentInset;
    NSLog(@"%@", NSStringFromUIEdgeInsets(edge));
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

#pragma mark - UIScrollViewDelegate

@end
