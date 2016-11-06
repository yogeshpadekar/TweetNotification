//
//  Entities.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Entities.h"
#import "Hashtags.h"
#import "DescriptionClass.h"
#import "Media.h"


NSString *const kEntitiesHashtags = @"hashtags";
NSString *const kEntitiesSymbols = @"symbols";
NSString *const kEntitiesUserMentions = @"user_mentions";
NSString *const kEntitiesUrls = @"urls";
NSString *const kEntitiesDescription = @"description";
NSString *const kEntitiesMedia = @"media";


@interface Entities ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Entities

@synthesize hashtags = _hashtags;
@synthesize symbols = _symbols;
@synthesize userMentions = _userMentions;
@synthesize urls = _urls;
@synthesize entitiesDescription = _entitiesDescription;
@synthesize media = _media;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
    NSObject *receivedHashtags = [dict objectForKey:kEntitiesHashtags];
    NSMutableArray *parsedHashtags = [NSMutableArray array];
    
    if ([receivedHashtags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHashtags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHashtags addObject:[Hashtags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHashtags isKindOfClass:[NSDictionary class]]) {
       [parsedHashtags addObject:[Hashtags modelObjectWithDictionary:(NSDictionary *)receivedHashtags]];
    }

    self.hashtags = [NSArray arrayWithArray:parsedHashtags];
            self.symbols = [self objectOrNilForKey:kEntitiesSymbols fromDictionary:dict];
            self.userMentions = [self objectOrNilForKey:kEntitiesUserMentions fromDictionary:dict];
            self.urls = [self objectOrNilForKey:kEntitiesUrls fromDictionary:dict];
            self.entitiesDescription = [DescriptionClass modelObjectWithDictionary:[dict objectForKey:kEntitiesDescription]];
    NSObject *receivedMedia = [dict objectForKey:kEntitiesMedia];
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
    NSMutableArray *tempArrayForHashtags = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.hashtags) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHashtags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHashtags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHashtags] forKey:kEntitiesHashtags];
    NSMutableArray *tempArrayForSymbols = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.symbols) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSymbols addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSymbols addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSymbols] forKey:kEntitiesSymbols];
    NSMutableArray *tempArrayForUserMentions = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.userMentions) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUserMentions addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUserMentions addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUserMentions] forKey:kEntitiesUserMentions];
    NSMutableArray *tempArrayForUrls = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.urls) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUrls] forKey:kEntitiesUrls];
    [mutableDict setValue:[self.entitiesDescription dictionaryRepresentation] forKey:kEntitiesDescription];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMedia] forKey:kEntitiesMedia];

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

    self.hashtags = [aDecoder decodeObjectForKey:kEntitiesHashtags];
    self.symbols = [aDecoder decodeObjectForKey:kEntitiesSymbols];
    self.userMentions = [aDecoder decodeObjectForKey:kEntitiesUserMentions];
    self.urls = [aDecoder decodeObjectForKey:kEntitiesUrls];
    self.entitiesDescription = [aDecoder decodeObjectForKey:kEntitiesDescription];
    self.media = [aDecoder decodeObjectForKey:kEntitiesMedia];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_hashtags forKey:kEntitiesHashtags];
    [aCoder encodeObject:_symbols forKey:kEntitiesSymbols];
    [aCoder encodeObject:_userMentions forKey:kEntitiesUserMentions];
    [aCoder encodeObject:_urls forKey:kEntitiesUrls];
    [aCoder encodeObject:_entitiesDescription forKey:kEntitiesDescription];
    [aCoder encodeObject:_media forKey:kEntitiesMedia];
}

- (id)copyWithZone:(NSZone *)zone {
    Entities *copy = [[Entities alloc] init];
    
    
    
    if (copy) {

        copy.hashtags = [self.hashtags copyWithZone:zone];
        copy.symbols = [self.symbols copyWithZone:zone];
        copy.userMentions = [self.userMentions copyWithZone:zone];
        copy.urls = [self.urls copyWithZone:zone];
        copy.entitiesDescription = [self.entitiesDescription copyWithZone:zone];
        copy.media = [self.media copyWithZone:zone];
    }
    
    return copy;
}


@end
