//
//  Large.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Large.h"


NSString *const kLargeW = @"w";
NSString *const kLargeH = @"h";
NSString *const kLargeResize = @"resize";


@interface Large ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Large

@synthesize w = _w;
@synthesize h = _h;
@synthesize resize = _resize;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.w = [[self objectOrNilForKey:kLargeW fromDictionary:dict] doubleValue];
            self.h = [[self objectOrNilForKey:kLargeH fromDictionary:dict] doubleValue];
            self.resize = [self objectOrNilForKey:kLargeResize fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kLargeW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kLargeH];
    [mutableDict setValue:self.resize forKey:kLargeResize];

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

    self.w = [aDecoder decodeDoubleForKey:kLargeW];
    self.h = [aDecoder decodeDoubleForKey:kLargeH];
    self.resize = [aDecoder decodeObjectForKey:kLargeResize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_w forKey:kLargeW];
    [aCoder encodeDouble:_h forKey:kLargeH];
    [aCoder encodeObject:_resize forKey:kLargeResize];
}

- (id)copyWithZone:(NSZone *)zone {
    Large *copy = [[Large alloc] init];
    
    
    
    if (copy) {

        copy.w = self.w;
        copy.h = self.h;
        copy.resize = [self.resize copyWithZone:zone];
    }
    
    return copy;
}


@end
