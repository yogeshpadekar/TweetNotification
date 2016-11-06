//
//  Media.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Media.h"
#import "Sizes.h"


NSString *const kMediaIdStr = @"id_str";
NSString *const kMediaMediaUrlHttps = @"media_url_https";
NSString *const kMediaMediaUrl = @"media_url";
NSString *const kMediaId = @"id";
NSString *const kMediaUrl = @"url";
NSString *const kMediaDisplayUrl = @"display_url";
NSString *const kMediaSizes = @"sizes";
NSString *const kMediaIndices = @"indices";
NSString *const kMediaExpandedUrl = @"expanded_url";
NSString *const kMediaType = @"type";


@interface Media ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Media

@synthesize idStr = _idStr;
@synthesize mediaUrlHttps = _mediaUrlHttps;
@synthesize mediaUrl = _mediaUrl;
@synthesize mediaIdentifier = _mediaIdentifier;
@synthesize url = _url;
@synthesize displayUrl = _displayUrl;
@synthesize sizes = _sizes;
@synthesize indices = _indices;
@synthesize expandedUrl = _expandedUrl;
@synthesize type = _type;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.idStr = [self objectOrNilForKey:kMediaIdStr fromDictionary:dict];
            self.mediaUrlHttps = [self objectOrNilForKey:kMediaMediaUrlHttps fromDictionary:dict];
            self.mediaUrl = [self objectOrNilForKey:kMediaMediaUrl fromDictionary:dict];
            self.mediaIdentifier = [[self objectOrNilForKey:kMediaId fromDictionary:dict] intValue];
            self.url = [self objectOrNilForKey:kMediaUrl fromDictionary:dict];
            self.displayUrl = [self objectOrNilForKey:kMediaDisplayUrl fromDictionary:dict];
            self.sizes = [Sizes modelObjectWithDictionary:[dict objectForKey:kMediaSizes]];
            self.indices = [self objectOrNilForKey:kMediaIndices fromDictionary:dict];
            self.expandedUrl = [self objectOrNilForKey:kMediaExpandedUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kMediaType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.idStr forKey:kMediaIdStr];
    [mutableDict setValue:self.mediaUrlHttps forKey:kMediaMediaUrlHttps];
    [mutableDict setValue:self.mediaUrl forKey:kMediaMediaUrl];
    [mutableDict setValue:[NSNumber numberWithInt:self.mediaIdentifier] forKey:kMediaId];
    [mutableDict setValue:self.url forKey:kMediaUrl];
    [mutableDict setValue:self.displayUrl forKey:kMediaDisplayUrl];
    [mutableDict setValue:[self.sizes dictionaryRepresentation] forKey:kMediaSizes];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIndices] forKey:kMediaIndices];
    [mutableDict setValue:self.expandedUrl forKey:kMediaExpandedUrl];
    [mutableDict setValue:self.type forKey:kMediaType];

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

    self.idStr = [aDecoder decodeObjectForKey:kMediaIdStr];
    self.mediaUrlHttps = [aDecoder decodeObjectForKey:kMediaMediaUrlHttps];
    self.mediaUrl = [aDecoder decodeObjectForKey:kMediaMediaUrl];
    self.mediaIdentifier = [aDecoder decodeIntegerForKey:kMediaId];
    self.url = [aDecoder decodeObjectForKey:kMediaUrl];
    self.displayUrl = [aDecoder decodeObjectForKey:kMediaDisplayUrl];
    self.sizes = [aDecoder decodeObjectForKey:kMediaSizes];
    self.indices = [aDecoder decodeObjectForKey:kMediaIndices];
    self.expandedUrl = [aDecoder decodeObjectForKey:kMediaExpandedUrl];
    self.type = [aDecoder decodeObjectForKey:kMediaType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_idStr forKey:kMediaIdStr];
    [aCoder encodeObject:_mediaUrlHttps forKey:kMediaMediaUrlHttps];
    [aCoder encodeObject:_mediaUrl forKey:kMediaMediaUrl];
    [aCoder encodeInteger:_mediaIdentifier forKey:kMediaId];
    [aCoder encodeObject:_url forKey:kMediaUrl];
    [aCoder encodeObject:_displayUrl forKey:kMediaDisplayUrl];
    [aCoder encodeObject:_sizes forKey:kMediaSizes];
    [aCoder encodeObject:_indices forKey:kMediaIndices];
    [aCoder encodeObject:_expandedUrl forKey:kMediaExpandedUrl];
    [aCoder encodeObject:_type forKey:kMediaType];
}

- (id)copyWithZone:(NSZone *)zone {
    Media *copy = [[Media alloc] init];
    
    
    
    if (copy) {

        copy.idStr = [self.idStr copyWithZone:zone];
        copy.mediaUrlHttps = [self.mediaUrlHttps copyWithZone:zone];
        copy.mediaUrl = [self.mediaUrl copyWithZone:zone];
        copy.mediaIdentifier = self.mediaIdentifier;
        copy.url = [self.url copyWithZone:zone];
        copy.displayUrl = [self.displayUrl copyWithZone:zone];
        copy.sizes = [self.sizes copyWithZone:zone];
        copy.indices = [self.indices copyWithZone:zone];
        copy.expandedUrl = [self.expandedUrl copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
