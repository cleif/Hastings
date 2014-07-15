//
//  MapViewController.h
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "HC"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) NSMutableArray *mapData;

@end
