//
//  FOOThingamajig.h
//  Thingamajigs
//
//  Created by Joe Ricioppo on 2/19/12.
//  BSD Licencse
//

#import <Foundation/Foundation.h>

@interface FOOThingamajig : NSObject

@property (strong, nonatomic) NSString *name;

+ (id)thingamajigWithDictionary:(NSDictionary *)dictionary;

@end
