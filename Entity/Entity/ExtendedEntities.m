//
//  ExtendedEntities.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ExtendedEntities.h"
#import "Media.h"


NSString *const kExtendedEntitiesMedia = @"media";


@interface ExtendedEntities ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ExtendedEntities

@synthesize media = _media;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedMedia = [dict objectForKey:kExtendedEntitiesMedia];
    NSMutableArray *parsedMedia = [NSMutableArray array];
    
    if ([receivedMedia isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMedia) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMedia addObject:[Media modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMedia isKindOfClass:[NSDictionary class]]) {
       [parsedMedia addObject:[Media modelObjectWithDictionary:(NSDictionary *)receivedMedia]];
    }

    self.media = [NSArray arrayWithArray:parsedMedia];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForMedia = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.media) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMedia addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMedia addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMedia] forKey:kExtendedEntitiesMedia];

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

    self.media = [aDecoder decodeObjectForKey:kExtendedEntitiesMedia];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_media forKey:kExtendedEntitiesMedia];
}

- (id)copyWithZone:(NSZone *)zone {
    ExtendedEntities *copy = [[ExtendedEntities alloc] init];
    
    
    
    if (copy) {

        copy.media = [self.media copyWithZone:zone];
    }
    
    return copy;
}


@end
