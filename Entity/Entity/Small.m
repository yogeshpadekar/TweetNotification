//
//  Small.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Small.h"


NSString *const kSmallW = @"w";
NSString *const kSmallH = @"h";
NSString *const kSmallResize = @"resize";


@interface Small ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Small

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
            self.w = [[self objectOrNilForKey:kSmallW fromDictionary:dict] doubleValue];
            self.h = [[self objectOrNilForKey:kSmallH fromDictionary:dict] doubleValue];
            self.resize = [self objectOrNilForKey:kSmallResize fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kSmallW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kSmallH];
    [mutableDict setValue:self.resize forKey:kSmallResize];

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

    self.w = [aDecoder decodeDoubleForKey:kSmallW];
    self.h = [aDecoder decodeDoubleForKey:kSmallH];
    self.resize = [aDecoder decodeObjectForKey:kSmallResize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_w forKey:kSmallW];
    [aCoder encodeDouble:_h forKey:kSmallH];
    [aCoder encodeObject:_resize forKey:kSmallResize];
}

- (id)copyWithZone:(NSZone *)zone {
    Small *copy = [[Small alloc] init];
    
    
    
    if (copy) {

        copy.w = self.w;
        copy.h = self.h;
        copy.resize = [self.resize copyWithZone:zone];
    }
    
    return copy;
}


@end
