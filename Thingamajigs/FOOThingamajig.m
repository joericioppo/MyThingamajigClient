//
//  FOOThingamajig.m
//  Thingamajigs
//
//  Created by Joe Ricioppo on 2/19/12.
//  BSD Licencse
//

#import "FOOThingamajig.h"
#import "NSObject+FOOCoding.h"

@interface FOOThingamajig ()
@property (strong, nonatomic) NSString *camelCasedPropertyName;
@end

@implementation FOOThingamajig

@synthesize name;
@synthesize camelCasedPropertyName;

+ (id)thingamajigWithDictionary:(NSDictionary *)dictionary {
    
    FOOThingamajig *thingamajig = [[FOOThingamajig alloc] initWithDictionary:dictionary];
    return thingamajig;
}

- (void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues {
    
    // if all of your keys match your property names you don't have to implement this method. just call initWithDictionary:
    
    for (NSString *key in [keyedValues allKeys]) {
        
        if ([key isEqualToString:@"name"]) {
            self.name = [keyedValues stringForKey:key];
        }
        else if ([key isEqualToString:@"name_with_an_underscore_bullshit"]) {
            self.camelCasedPropertyName = [keyedValues stringForKey:key];
        }
    }
}

@end
