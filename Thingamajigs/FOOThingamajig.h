//
//  FOOThingamajig.h
//  Thingamajigs
//
//  Created by Joe Ricioppo on 2/19/12.
//  Copyright (c) 2012 Cocoa Developer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FOOThingamajig : NSObject

@property (strong, nonatomic) NSString *name;

+ (id)thingamajigWithDictionary:(NSDictionary *)dictionary;

@end
