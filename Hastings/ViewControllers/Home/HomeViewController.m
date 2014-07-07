//
//  HomeViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
      
    }
    return self;
}

- (void) viewDidLoad{
    
    [super viewDidLoad];
   
    self.title = @"Home";
    
    NSString *fullURL = @"http://www.hastings.edu";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_HomeWebView loadRequest:requestObj];
}



@end
