//
//  NSObject+FOOCoding.h
//  Thingamajigs
//
//  Created by Joe Ricioppo on 2/20/12.
//

#import <Foundation/Foundation.h>

@interface NSObject (FOOCoding)

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (NSArray *)arrayForKey:(NSString *)key;
- (NSArray *)arrayOfClass:(Class)objectClass forKey:(NSString *)key;
- (NSArray *)arrayOfClass:(Class)objectClass;
- (NSArray *)arrayOfDictionariesForKey:(NSString *)key;
- (NSArray *)arrayOfStringsForKey:(NSString *)key;

- (BOOL)boolForKey:(NSString *)key;
- (NSData *)dataForKey:(NSString *)key;
- (NSDate *)dateForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (double)doubleForKey:(NSString *)key;
- (CGFloat)floatForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSUInteger)unsignedIntegerForKey:(NSString *)key;
- (NSURL *)URLForKey:(NSString *)key;

- (id)valueForKey:(NSString *)key assertingClass:(Class)class;
- (id)valueForKey:(NSString *)key assertingRespondsToSelector:(SEL)theSelector;
- (BOOL)contentsOfCollection:(id <NSFastEnumeration>)theCollection areKindOfClass:(Class)theClass;

@end
