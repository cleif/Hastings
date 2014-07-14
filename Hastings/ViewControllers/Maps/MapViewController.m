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


@interface MapViewController ()

@end

//defined coordinates
#define HC_LATITUDE 40.5960000
#define HC_LONGGITUDE -98.3707043
#define SPAN 0.0125f;
#define METERS_PER_MILE 1609.344

#define CHAPEL_LATTITUDE 40.591628
#define CHAPEL_LONGITUDE -98.373567

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
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pp:)];
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
    
    //Campus Locations Annotations
    //Location 1: Chapel
    CLLocationCoordinate2D chapelLocation;
    chapelLocation.longitude = CHAPEL_LONGITUDE;
    chapelLocation.latitude = CHAPEL_LATTITUDE;
    Annotation * chapelAnnotation =[[Annotation alloc] init];
    
    
    chapelAnnotation.coordinate = chapelLocation;
    chapelAnnotation.title = @"French Memorial Chapel";
    
    [self.mapView addAnnotation:chapelAnnotation];
    
    //Location 2: Kewitt Gymnasium
    
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
    NSDictionary *buildingList          = [results objectForKey:@"_id"];
    
    //loop through dictionary adding title and snippet with coordinates to array
    for (NSDictionary *item in buildingList) {
        NSArray *buildingName   = (NSArray*) [item objectForKey:@"title"];
        NSArray *buildingDescr  = (NSArray*) [item objectForKey:@"snippet"];
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude     = [[item objectForKey:@"latitude"] doubleValue];
        coordinate.longitude    = [[item objectForKey:@"longitude"] doubleValue];

        HCCampusLocation *campusLocation   = [[HCCampusLocation alloc] init];
        
        campusLocation.buildingName         = [item objectForKey:@"title"];
        campusLocation.buildingDescr        = [item objectForKey:@"snippet"];
        campusLocation.coordinate           = coordinate;
   }
//    
//    //add the array of locations to the location list
//    [returnLocationList addObject:campusLocation];
    
    
    //return the list to populate the map.
    return returnLocationList;
}

@end

//NotesFromCasey
/*{
//- (NSMutableArray*) getAllFCSAOfficeLoctions{
//    
//    NSMutableArray *returnOfficeList = [[NSMutableArray alloc] init];
//    
//    NSString *filePath               = [[NSBundle mainBundle] pathForResource:@"FCSAOfficeLocations" ofType:@"json"];
//    NSData *myData                   = [NSData dataWithContentsOfFile:filePath];
//    NSDictionary *results            = [NSJSONSerialization JSONObjectWithData:myData options:kNilOptions error:nil];
//    NSDictionary *officeList         = [results objectForKey:@"Locations"];
//    
//    
//    for (NSDictionary *item in officeList){
//        
//        NSArray *address        = (NSArray*) [item objectForKey:@"Address"];
//        NSArray *mailingAddress = (NSArray*) [item objectForKey:@"MailingAddress"];
//
//        CLLocationCoordinate2D coordinate;
//        coordinate.latitude  = [[item objectForKey:@"Lat"] doubleValue];
//        coordinate.longitude = [[item objectForKey:@"Lng"] doubleValue];
//        
//        FCSAOfficeLocation *officeLocation = [[FCSAOfficeLocation alloc] init];
//        
//        officeLocation.name             = [item objectForKey:@"Name"];
//        officeLocation.thCoordinate     = coordinate;
//        officeLocation.distanceToOffice = [self getDistanceToFCSAOfficeLocation:officeLocation];
//        
//        for (NSDictionary *addressItem in address) {
//            
//            officeLocation.address      = [addressItem objectForKey:@"Street"];
//            officeLocation.city         = [addressItem objectForKey:@"City"];
//            officeLocation.state        = [addressItem objectForKey:@"State"];
//            officeLocation.stateLong    = [addressItem objectForKey:@"StateLong"];
//            officeLocation.zipCode      = [addressItem objectForKey:@"ZipCode"];
//            officeLocation.phoneNumber  = [addressItem objectForKey:@"Phone"];
//            officeLocation.faxNumber    = [addressItem objectForKey:@"Fax"];
//            officeLocation.officeEmail  = [addressItem objectForKey:@"OfficeEmail"];
//            officeLocation.country      = @"United States";
//        }
//        
//        
//        for (NSDictionary *mailingAddressItem in mailingAddress) {
//            
//            officeLocation.mailingAddress      = [mailingAddressItem objectForKey:@"MailingAddress"];
//            officeLocation.mailingCity         = [mailingAddressItem objectForKey:@"MailingCity"];
//            officeLocation.mailingState        = [mailingAddressItem objectForKey:@"State"];
//            officeLocation.mailingZipCode      = [mailingAddressItem objectForKey:@"ZipCode"];
//            officeLocation.mailingCountry      = @"United States";
//        }
//        
//        
//        [returnOfficeList addObject:officeLocation];
//    }
//    
//    return returnOfficeList;
//}
//
}*/

