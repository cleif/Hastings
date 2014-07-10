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
    Annotation * chapelAnnotation =[Annotation alloc];
    chapelAnnotation.title = @"French Memorial Chapel";
    //chapelAnnotation.subtitle = @" ";
    [self.mapView addAnnotation:chapelAnnotation];
    
    //Location 2: Kewitt Gymnasium
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
