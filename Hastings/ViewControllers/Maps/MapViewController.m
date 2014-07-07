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
#define HC_LATITUDE 40.5943979
#define HC_LONGGITUDE -98.3707043
#define SPAN 0.015f;
#define METERS_PER_MILE 1609.344

#define DEN_LATTITUDE 40.5962
#define DEN_LONGITUDE -98.374084

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
    
    //Location 1: The Den
    CLLocationCoordinate2D denLocation;
    denLocation.longitude = DEN_LONGITUDE;
    denLocation.latitude = DEN_LATTITUDE;
    Annotation * denAnnotation =[Annotation alloc];
    denAnnotation.title = @"The Den";
    denAnnotation.subtitle = @"@HC_DEN Voted Hastings College Best House";
    [self.mapView addAnnotation:denAnnotation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
