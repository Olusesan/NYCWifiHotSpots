//
//  ViewController.m
//  WifiHotSpot
//
//  Created by Olusesan Ajina on 3/25/15.
//  Copyright (c) 2015 Olusesan Ajina. All rights reserved.
//

#import "ViewController.h"
#import "MyLocation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _MapView.showsUserLocation = YES;
    _MapView.delegate = self;
    
//     Get locally stored loaction json data in app bundle and convert to type data
    NSString *path = [[NSBundle mainBundle] pathForResource:@"locations" ofType:@"json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    
//   Covert json data into a dictionary. 
    
    self.row = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil]; NSLog(@"called yeah rite");
    
    [self PlotWifiLocation];
    
    
  
//    Passing wifi location static json data from nyc.org
//    NSString *url = @"https://nycopendata.socrata.com/api/views/jd4g-ks2z/rows.json?accessType=DOWNLOAD";
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if (response !=nil) {
    
//            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//            self.locations = object[@"data"];
//            NSLog(@"%@", object);
    
//        }
//        else {
//            self.title = @"No data";
//            NSLog(@"No data");
//        }
//    }];
    
}
    
    
    // Do any additional setup after loading the view, typically from a nib.


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//  Method to zoom into map display
- (IBAction)zoomin:(id)sender {
    MKUserLocation *userlocation = _MapView.userLocation;
    MKCoordinateRegion  region = MKCoordinateRegionMakeWithDistance(userlocation.location.coordinate, 2000, 2000);
    [_MapView setRegion:region animated:NO];
}

// Method for toggling between standard and satellite view
- (IBAction)changeMapType:(id)sender {
    if (_MapView.mapType == MKMapTypeStandard)
    {
        _MapView.mapType = MKMapTypeSatellite;
    } else {
        _MapView.mapType = MKMapTypeStandard;
    }
}

//  Method to update user location with user movement
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    _MapView.centerCoordinate =
    userLocation.location.coordinate;
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation    {
    if ([annotation isKindOfClass:[MyLocation class]]){
//    Create a reusable identifier
        static NSString *PinIdentifier = @"UserLocationPin";
        
//  Dequeue existing pin in map view
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)
        [mapView
        dequeueReusableAnnotationViewWithIdentifier:PinIdentifier];
        
//  Create a new location pin
        if (!pinView) {
        
            
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:PinIdentifier];
            
            pinView.pinColor = MKPinAnnotationColorGreen;
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
        } else {
            pinView.annotation = annotation;
            
            return pinView;
        }

    }
    return nil;
}

// Passing json data received into map view
-(void)PlotWifiLocation {
    
    NSArray *data = self.row[@"row"];
    
    for (NSDictionary *wifidct in data) {
        
//        obtain latitude,longitude and address from array created
        NSDictionary *shapedict = wifidct [@"shape"];
        NSNumber *latitude = shapedict [@"latitude"];
        NSNumber *longitude = shapedict [@"longitude"];
        NSString *locationname = wifidct [@"name"];
        NSString *address = wifidct [@"address"];
        
//  Assign data obtained into map view
        CLLocationCoordinate2D coordinate;

        coordinate.latitude = latitude.doubleValue;
        coordinate.longitude = longitude.doubleValue;
        MyLocation *annotation = [[MyLocation alloc]initWithName:locationname address:address coordinate:coordinate];
        [_MapView addAnnotation:annotation];
        
        
    }
    
//    [self PlotWifiLocation:responseData];

}
@end
