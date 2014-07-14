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
    
    //refresh
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemClicked)];
    [self.navigationItem setRightBarButtonItem: refreshButton];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pp:)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.title = @"Athletics";
    [self loadInitialView];

}

-(void)loadInitialView{
    NSString *fullURL = @"http://www.hastingsbroncos.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_AthleticsWebView  loadRequest:requestObj];
}

-(void)buttonItemClicked{
    [self loadInitialView];
}

@end
