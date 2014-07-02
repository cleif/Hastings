//
//  AppDelegate.m
//  Hastings
//
//  Created by Casey Egan  on 7/2/14.
//
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize menuViewController = _menuViewController;



- (IIViewDeckController*) initializeMainViewControllers {
    
    UIViewController *menuViewController      = [[MenuViewController alloc] init];
    UIViewController *rootViewController      = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    IIViewDeckController* deckController      = [[IIViewDeckController alloc] initWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:rootViewController]
                                                                                        leftViewController:menuViewController];
    
    return deckController;
}





- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
   
    IIViewDeckController* deckController    = [self initializeMainViewControllers];
    
    self.menuViewController                 = deckController.leftController;
    self.rootViewController                 = deckController.centerController;
    
    self.window.rootViewController          = deckController;
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
