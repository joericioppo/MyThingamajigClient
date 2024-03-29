//
//  FOOThingamajigClient.h
//  Thingamajigs
//
//  Created by Joe Ricioppo on 2/19/12.
//  BSD Licencse
//

#import <Foundation/Foundation.h>

@class FOOThingamajig;

@interface FOOThingamajigClient : NSObject

+ (FOOThingamajigClient *)sharedClient;

- (void)requestThingamajigWithName:(NSString *)name completionBlock:(void (^)(FOOThingamajig *thingamajig, NSError *error))block;
- (void)requestThingamajigsWithCompletionBlock:(void (^)(NSArray *thingamajigs, NSError *error))block;

                                                                     
@end
