//
//  jsonresponse.h
//  WifiHotSpot
//
//  Created by Olusesan Ajina on 3/30/15.
//  Copyright (c) 2015 Olusesan Ajina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jsonresponse : NSObject

@property (nonatomic, strong) NSString *locationname;
@property (nonatomic, strong) NSString *locationaddress;
@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSNumber *latitude;

@end
