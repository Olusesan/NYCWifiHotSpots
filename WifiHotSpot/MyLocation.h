//
//  MyLocation.h
//  WifiHotSpot
//
//  Created by Olusesan Ajina on 3/26/15.
//  Copyright (c) 2015 Olusesan Ajina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import "ViewController.h"



@interface MyLocation : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) CLLocationCoordinate2D theCoordinate;

- (id)initWithName:(NSString*)name address:(NSString*)address coordinate:(CLLocationCoordinate2D)coordinate;

//- (MKMapItem*)mapItem;
//@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
//@property (nonatomic, readonly) Locations *locationz;
//
//- (instancetype)initWithLocation:(Locations *)locationz;

@end
