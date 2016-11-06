//
//  Sizes.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Sizes.h"
#import "Large.h"
#import "Medium.h"
#import "Thumb.h"
#import "Small.h"


NSString *const kSizesLarge = @"large";
NSString *const kSizesMedium = @"medium";
NSString *const kSizesThumb = @"thumb";
NSString *const kSizesSmall = @"small";


@interface Sizes ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Sizes

@synthesize large = _large;
@synthesize medium = _medium;
@synthesize thumb = _thumb;
@synthesize small = _small;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.large = [Large modelObjectWithDictionary:[dict objectForKey:kSizesLarge]];
            self.medium = [Medium modelObjectWithDictionary:[dict objectForKey:kSizesMedium]];
            self.thumb = [Thumb modelObjectWithDictionary:[dict objectForKey:kSizesThumb]];
            self.small = [Small modelObjectWithDictionary:[dict objectForKey:kSizesSmall]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.large dictionaryRepresentation] forKey:kSizesLarge];
    [mutableDict setValue:[self.medium dictionaryRepresentation] forKey:kSizesMedium];
    [mutableDict setValue:[self.thumb dictionaryRepresentation] forKey:kSizesThumb];
    [mutableDict setValue:[self.small dictionaryRepresentation] forKey:kSizesSmall];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.large = [aDecoder decodeObjectForKey:kSizesLarge];
    self.medium = [aDecoder decodeObjectForKey:kSizesMedium];
    self.thumb = [aDecoder decodeObjectForKey:kSizesThumb];
    self.small = [aDecoder decodeObjectForKey:kSizesSmall];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_large forKey:kSizesLarge];
    [aCoder encodeObject:_medium forKey:kSizesMedium];
    [aCoder encodeObject:_thumb forKey:kSizesThumb];
    [aCoder encodeObject:_small forKey:kSizesSmall];
}

- (id)copyWithZone:(NSZone *)zone {
    Sizes *copy = [[Sizes alloc] init];
    
    
    
    if (copy) {

        copy.large = [self.large copyWithZone:zone];
        copy.medium = [self.medium copyWithZone:zone];
        copy.thumb = [self.thumb copyWithZone:zone];
        copy.small = [self.small copyWithZone:zone];
    }
    
    return copy;
}


@end
