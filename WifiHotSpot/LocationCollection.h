//
//  LocationCollection.h
//  WifiHotSpot
//
//  Created by Olusesan Ajina on 4/2/15.
//  Copyright (c) 2015 Olusesan Ajina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocationCollection : NSObject

-(instancetype)initwithLocation:(NSArray *)locations;
-(void)fetchFromLocalJSON:(id) JSON;


@end

@interface LocationCollection (CollectionInterface)

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;

@end