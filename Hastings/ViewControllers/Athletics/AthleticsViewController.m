//
//  AthleticsViewController.h
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "AthleticsViewController.h"

@interface AthleticsViewController ()

@end

@implementation AthleticsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.title = @"Athletics";
    NSString *fullURL = @"http://www.hastingsbroncos.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_AthleticsWebView  loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
