//
//  MapViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "IIViewDeckController.h"


@interface MapViewController ()

@end

//defined coordinates 40.593490, -98.370377
#define HC_LATITUDE 40.593490
#define HC_LONGGITUDE -98.369798
#define SPAN 0.0125f;
#define METERS_PER_MILE 1609.344

@implementation MapViewController
@synthesize mapView;
@synthesize mapData;



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
    
    self.screenName = @"MapViewController";
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.mapView.delegate = self;

    self.title = @"Campus Map";
    //map implementation
    //create region
    MKCoordinateRegion hastingsCollegeRegion;
    //center
    CLLocationCoordinate2D center;
    center.latitude = HC_LATITUDE;
    center.longitude = HC_LONGGITUDE;
    
    //spans
    MKCoordinateSpan span;
    span.latitudeDelta = SPAN;
    span.longitudeDelta = SPAN;
    hastingsCollegeRegion.center = center;
    hastingsCollegeRegion.span = span;
    
    //set map view
    [mapView setRegion:hastingsCollegeRegion animated:YES];
    
    [self.mapView addAnnotations:[self getCampusLocations]];
}

- (MKAnnotationView *) mapView:(MKMapView *) mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[Annotation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:@""];
        
        if (annotationView == nil) {
            
            
            annotationView                           = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@""];
            annotationView.image                     = [UIImage imageNamed:@"map-marker.png"];
            annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            annotationView.tintColor                 = [UIColor colorWithRed:153.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1];;
            annotationView.enabled                   = YES;
            annotationView.canShowCallout            = YES;
        }
        else
        {
            annotationView.annotation = annotation;
        }
        
        return annotationView;
    }
    
    return nil;
}

- (void) mapView:(MKMapView *) mapView didAddAnnotationViews:(NSArray *)views {
    
    for (MKAnnotationView *anotationView in views) {
        
        CGRect endFrame = anotationView.frame;
        
        anotationView.frame = CGRectMake(anotationView.frame.origin.x, anotationView.frame.origin.y - 230.0, anotationView.frame.size.width, anotationView.frame.size.height);
        
        [UIView animateWithDuration:0.45f delay:0.30f options:UIViewAnimationOptionCurveEaseIn animations:^{
            
            [anotationView setFrame:endFrame];
        }
                         completion:^ (BOOL finished){
                             
                             
                             
                         }];
    }
}


-(NSMutableArray*) getCampusLocations{
    
    // create array to hold all locations
    NSMutableArray *returnLocationList  = [[NSMutableArray alloc] init];

    // create connection to data source and create dictionary of data
    NSString *filePath                  = [[NSBundle mainBundle] pathForResource:@"map-data" ofType:@"json"];
    NSData *hcData                      = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *results               = [NSJSONSerialization JSONObjectWithData:hcData options:kNilOptions error:nil];
    NSDictionary *buildingList          = [results objectForKey:@"Locations"];
    
    //loop through dictionary adding title and snippet with coordinates to array
    for (NSDictionary *item in buildingList) {
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude     = [[item objectForKey:@"latitude"] doubleValue];
        coordinate.longitude    = [[item objectForKey:@"longitude"] doubleValue];

        Annotation *campusLocation   = [[Annotation alloc] init];
        
        campusLocation.buildingName         = [item objectForKey:@"title"];
        campusLocation.buildingDesc        = [item objectForKey:@"snippet"];
        campusLocation.coordinate           = coordinate;
        
        [returnLocationList addObject:campusLocation];
   }
//    
//    //add the array of locations to the location list
    
    
    
    //return the list to populate the map.
    return returnLocationList;
}

@end
