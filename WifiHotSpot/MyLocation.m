//
//  MyLocation.m
//  WifiHotSpot
//
//  Created by Olusesan Ajina on 3/26/15.
//  Copyright (c) 2015 Olusesan Ajina. All rights reserved.
//

#import "MyLocation.h"
//#import "ViewController.h"




@interface MyLocation ()

@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
//@property (nonatomic, readwrite) Locations *locationz;

@end
@implementation MyLocation

//-(void)PlotWifiLocation {
//    id userLocation = [MKMapView userLocation];

   
// Create annotation objects

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate {

    if ((self = [super init])) {
    if ([name isKindOfClass:[NSString class]]) {
        self.name = name;
    } else {
        self.name = @"Unknown wifi location";
    }
    self.address = address;
    self.theCoordinate = coordinate;
}
    return self;
}

- (NSString *)title {
    return _name;
}

- (NSString *)subtitle {
    return _address;
}

- (CLLocationCoordinate2D)coordinate {
    return _theCoordinate;
}





@end
