//
//  FOOThingamajigClient.m
//  Thingamajigs
//
//  Created by Joe Ricioppo on 2/19/12.
//  Copyright (c) 2012 Cocoa Developer. All rights reserved.
//

#import "FOOThingamajigClient.h"
#import "FOOThingamajig.h"

#import "NSObject+FOOCoding.h"

@interface FOOThingamajigClient ()
@property (strong, nonatomic) NSOperationQueue *operationQueue;
- (void)requestValueForEndpoint:(NSString *)endPoint completionBlock:(void (^)(id result, NSError *error))block;
@end

#pragma mark -

static NSString *const kFOOThingamajigBaseURLString = @"https://api.github.com/";
static NSString *const kFOOThingamajigAPISearch = @"users/";
static NSString *const kFOOThingamajigAPIThingamajigs = @"thingamajigs/";

static NSString *const kFOOThingamajigKey = @"thingamajig";
static NSString *const kFOOThingamajigsKey = @"thingamajigs";

@implementation FOOThingamajigClient

@synthesize operationQueue;

#pragma mark -

static FOOThingamajigClient *sharedThingamajigClient = nil;

+ (FOOThingamajigClient *)sharedClient {
    
    return sharedThingamajigClient ?: (sharedThingamajigClient = [[FOOThingamajigClient alloc] init]);
}

- (id)init {
    
    self = [super init];
    if (self == nil) {
        return  nil;
    }
    
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    return self;
}

#pragma mark -

- (void)requestValueForEndpoint:(NSString *)endPoint completionBlock:(void (^)(id result, NSError *error))completionBlock {
    
    if (completionBlock == nil) {
        
        // whoops...
    }
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", kFOOThingamajigBaseURLString, endPoint]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:self.operationQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *requestError) {
        
        NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
        
        id result = nil;
        NSError *JSONError = nil;
        
        switch (statusCode) {
            case 200:
                result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONError];
                break;
                
            // ...
                
            case 404:
                // ...
                break;
                
            default:
                break;
        }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            completionBlock(result, requestError ?: JSONError);
        }];                 
    }];
}

- (void)requestThingamajigWithName:(NSString *)name completionBlock:(void (^)(FOOThingamajig *thingamajig, NSError *error))completionBlock {
    
    if (completionBlock == nil) {
        
        // whoops...
    }
    
    NSString *endPoint = [NSString stringWithFormat:@"%@%@", kFOOThingamajigAPISearch, name];
    
    [self requestValueForEndpoint:endPoint completionBlock:^(id result, NSError *error) {
       
        if (result) {            
            FOOThingamajig *thingamajig = [FOOThingamajig thingamajigWithDictionary:[result valueForKey:kFOOThingamajigKey]];            
            completionBlock(thingamajig, nil);
        }
        else {            
            completionBlock(nil, error);
        }
        
    }];
}

                            
- (void)requestThingamajigsWithCompletionBlock:(void (^)(NSArray *thingamajigs, NSError *error))completionBlock {
    
    if (completionBlock == nil) {
        
        // whoops...
    }
    
    NSString *endPoint = [NSString stringWithFormat:@"%@%@", kFOOThingamajigBaseURLString, kFOOThingamajigAPIThingamajigs];
    
    [self requestValueForEndpoint:endPoint completionBlock:^(id result, NSError *error) {
                
        // if everything that comes back from the service is in an array just build an end-point and call requestValueForEndPoint:resultClass:completionBlock: passing in a class, and then call arrayOfClass:forKey: with the JSON result, and then completionBlock() with the end result.
        
        NSArray *thingamajigs = [result arrayOfClass:[FOOThingamajig class] forKey:kFOOThingamajigsKey];
        completionBlock(thingamajigs, error);
        
    }];
}

@end
