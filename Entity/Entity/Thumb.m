//
//  Thumb.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Thumb.h"


NSString *const kThumbW = @"w";
NSString *const kThumbH = @"h";
NSString *const kThumbResize = @"resize";


@interface Thumb ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Thumb

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
            self.w = [[self objectOrNilForKey:kThumbW fromDictionary:dict] doubleValue];
            self.h = [[self objectOrNilForKey:kThumbH fromDictionary:dict] doubleValue];
            self.resize = [self objectOrNilForKey:kThumbResize fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kThumbW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kThumbH];
    [mutableDict setValue:self.resize forKey:kThumbResize];

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

    self.w = [aDecoder decodeDoubleForKey:kThumbW];
    self.h = [aDecoder decodeDoubleForKey:kThumbH];
    self.resize = [aDecoder decodeObjectForKey:kThumbResize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_w forKey:kThumbW];
    [aCoder encodeDouble:_h forKey:kThumbH];
    [aCoder encodeObject:_resize forKey:kThumbResize];
}

- (id)copyWithZone:(NSZone *)zone {
    Thumb *copy = [[Thumb alloc] init];
    
    
    
    if (copy) {

        copy.w = self.w;
        copy.h = self.h;
        copy.resize = [self.resize copyWithZone:zone];
    }
    
    return copy;
}


@end
