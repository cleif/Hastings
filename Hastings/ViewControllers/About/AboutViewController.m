//
//  AboutViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "AboutViewController.h"
#import "IIViewDeckController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    //self.screenName = @"AboutViewController";
    
    self.title = @"About";
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
}

//google analytics
-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.screenName = @"About";
}

@end
