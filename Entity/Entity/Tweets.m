//
//  Tweets.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Tweets.h"
#import "Statuses.h"


NSString *const kTweetsStatuses = @"statuses";


@interface Tweets ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Tweets

@synthesize statuses = _statuses;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedStatuses = [dict objectForKey:kTweetsStatuses];
    NSMutableArray *parsedStatuses = [NSMutableArray array];
    
    if ([receivedStatuses isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedStatuses) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedStatuses addObject:[Statuses modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedStatuses isKindOfClass:[NSDictionary class]]) {
       [parsedStatuses addObject:[Statuses modelObjectWithDictionary:(NSDictionary *)receivedStatuses]];
    }

    self.statuses = [NSArray arrayWithArray:parsedStatuses];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForStatuses = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.statuses) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStatuses addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStatuses addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStatuses] forKey:kTweetsStatuses];

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

    self.statuses = [aDecoder decodeObjectForKey:kTweetsStatuses];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_statuses forKey:kTweetsStatuses];
}

- (id)copyWithZone:(NSZone *)zone {
    Tweets *copy = [[Tweets alloc] init];
    
    
    
    if (copy) {

        copy.statuses = [self.statuses copyWithZone:zone];
    }
    
    return copy;
}


@end
