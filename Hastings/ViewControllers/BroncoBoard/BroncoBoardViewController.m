//
//  BroncoBoardViewController.m
//  Hastings
//
//  Created by Casey Egan  on 7/2/14.
//
//

#import "BroncoBoardViewController.h"

@interface BroncoBoardViewController ()

@end

@implementation BroncoBoardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Broncoboard";
    NSString *fullURL = @"http://broncoboard.hastings.edu/login/index.php";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_BBWebView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
