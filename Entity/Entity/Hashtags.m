//
//  Hashtags.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Hashtags.h"


NSString *const kHashtagsIndices = @"indices";
NSString *const kHashtagsText = @"text";


@interface Hashtags ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Hashtags

@synthesize indices = _indices;
@synthesize text = _text;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.indices = [self objectOrNilForKey:kHashtagsIndices fromDictionary:dict];
            self.text = [self objectOrNilForKey:kHashtagsText fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForIndices = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.indices) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIndices addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIndices addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIndices] forKey:kHashtagsIndices];
    [mutableDict setValue:self.text forKey:kHashtagsText];

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

    self.indices = [aDecoder decodeObjectForKey:kHashtagsIndices];
    self.text = [aDecoder decodeObjectForKey:kHashtagsText];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_indices forKey:kHashtagsIndices];
    [aCoder encodeObject:_text forKey:kHashtagsText];
}

- (id)copyWithZone:(NSZone *)zone {
    Hashtags *copy = [[Hashtags alloc] init];
    
    
    
    if (copy) {

        copy.indices = [self.indices copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
    }
    
    return copy;
}


@end
