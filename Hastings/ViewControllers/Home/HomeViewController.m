//
//  HomeViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "HomeViewController.h"
#import "IIViewDeckController.h"

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
    
    //refresh
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(buttonItemClicked)];
    [self.navigationItem setRightBarButtonItem: refreshButton];
    
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStyleBordered target:self.viewDeckController action:@selector(toggleLeftView)];
    //menu icon
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.title = @"Home";
    
    [self loadInitialView];
}

-(void)loadInitialView{
    NSString *fullURL = @"http://www.hastings.edu";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_HomeWebView loadRequest:requestObj];
}

//add spinner UX
-(void)buttonItemClicked{
    [self loadInitialView];
}



@end
