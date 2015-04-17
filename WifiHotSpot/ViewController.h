//
//  ViewController.h
//  WifiHotSpot
//
//  Created by Olusesan Ajina on 3/25/15.
//  Copyright (c) 2015 Olusesan Ajina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyLocation.h"


@interface ViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *MapView;
@property (strong, nonatomic) NSArray *locations;
@property (nonatomic, strong) NSDictionary *row;

- (IBAction)zoomin:(id)sender;

- (IBAction)changeMapType:(id)sender;

-(void)PlotWifiLocation;

@end

