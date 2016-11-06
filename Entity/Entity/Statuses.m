//
//  Statuses.m
//
//  Created by Yogesh  on 05/11/16
//  Copyright © 2016 Yogesh Padekar. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//documentation files (the "Software"), to deal in the Software without restriction, including without
//limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
//Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all copies or substantial
//portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
//LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
//EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
//AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
//OR OTHER DEALINGS IN THE SOFTWARE.

#import "Statuses.h"
#import "Metadata.h"
#import "Entities.h"
#import "User.h"
#import "ExtendedEntities.h"


NSString *const kStatusesPlace = @"place";
NSString *const kStatusesCoordinates = @"coordinates";
NSString *const kStatusesSource = @"source";
NSString *const kStatusesTruncated = @"truncated";
NSString *const kStatusesMetadata = @"metadata";
NSString *const kStatusesPossiblySensitive = @"possibly_sensitive";
NSString *const kStatusesLang = @"lang";
NSString *const kStatusesIdStr = @"id_str";
NSString *const kStatusesInReplyToStatusIdStr = @"in_reply_to_status_id_str";
NSString *const kStatusesEntities = @"entities";
NSString *const kStatusesInReplyToScreenName = @"in_reply_to_screen_name";
NSString *const kStatusesRetweetCount = @"retweet_count";
NSString *const kStatusesFavorited = @"favorited";
NSString *const kStatusesGeo = @"geo";
NSString *const kStatusesId = @"id";
NSString *const kStatusesUser = @"user";
NSString *const kStatusesInReplyToUserId = @"in_reply_to_user_id";
NSString *const kStatusesExtendedEntities = @"extended_entities";
NSString *const kStatusesRetweeted = @"retweeted";
NSString *const kStatusesText = @"text";
NSString *const kStatusesCreatedAt = @"created_at";
NSString *const kStatusesInReplyToUserIdStr = @"in_reply_to_user_id_str";
NSString *const kStatusesInReplyToStatusId = @"in_reply_to_status_id";
NSString *const kStatusesContributors = @"contributors";
NSString *const kStatusesIsQuoteStatus = @"is_quote_status";
NSString *const kStatusesFavoriteCount = @"favorite_count";


@interface Statuses ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Statuses

@synthesize place = _place;
@synthesize coordinates = _coordinates;
@synthesize source = _source;
@synthesize truncated = _truncated;
@synthesize metadata = _metadata;
@synthesize possiblySensitive = _possiblySensitive;
@synthesize lang = _lang;
@synthesize idStr = _idStr;
@synthesize inReplyToStatusIdStr = _inReplyToStatusIdStr;
@synthesize entities = _entities;
@synthesize inReplyToScreenName = _inReplyToScreenName;
@synthesize retweetCount = _retweetCount;
@synthesize favorited = _favorited;
@synthesize geo = _geo;
@synthesize statusesIdentifier = _statusesIdentifier;
@synthesize user = _user;
@synthesize inReplyToUserId = _inReplyToUserId;
@synthesize extendedEntities = _extendedEntities;
@synthesize retweeted = _retweeted;
@synthesize text = _text;
@synthesize createdAt = _createdAt;
@synthesize inReplyToUserIdStr = _inReplyToUserIdStr;
@synthesize inReplyToStatusId = _inReplyToStatusId;
@synthesize contributors = _contributors;
@synthesize isQuoteStatus = _isQuoteStatus;
@synthesize favoriteCount = _favoriteCount;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.place = [self objectOrNilForKey:kStatusesPlace fromDictionary:dict];
            self.coordinates = [self objectOrNilForKey:kStatusesCoordinates fromDictionary:dict];
            self.source = [self objectOrNilForKey:kStatusesSource fromDictionary:dict];
            self.truncated = [[self objectOrNilForKey:kStatusesTruncated fromDictionary:dict] boolValue];
            self.metadata = [Metadata modelObjectWithDictionary:[dict objectForKey:kStatusesMetadata]];
            self.possiblySensitive = [[self objectOrNilForKey:kStatusesPossiblySensitive fromDictionary:dict] boolValue];
            self.lang = [self objectOrNilForKey:kStatusesLang fromDictionary:dict];
            self.idStr = [self objectOrNilForKey:kStatusesIdStr fromDictionary:dict];
            self.inReplyToStatusIdStr = [self objectOrNilForKey:kStatusesInReplyToStatusIdStr fromDictionary:dict];
            self.entities = [Entities modelObjectWithDictionary:[dict objectForKey:kStatusesEntities]];
            self.inReplyToScreenName = [self objectOrNilForKey:kStatusesInReplyToScreenName fromDictionary:dict];
            self.retweetCount = [[self objectOrNilForKey:kStatusesRetweetCount fromDictionary:dict] doubleValue];
            self.favorited = [[self objectOrNilForKey:kStatusesFavorited fromDictionary:dict] boolValue];
            self.geo = [self objectOrNilForKey:kStatusesGeo fromDictionary:dict];
            self.statusesIdentifier = [[self objectOrNilForKey:kStatusesId fromDictionary:dict] intValue];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kStatusesUser]];
            self.inReplyToUserId = [self objectOrNilForKey:kStatusesInReplyToUserId fromDictionary:dict];
            self.extendedEntities = [ExtendedEntities modelObjectWithDictionary:[dict objectForKey:kStatusesExtendedEntities]];
            self.retweeted = [[self objectOrNilForKey:kStatusesRetweeted fromDictionary:dict] boolValue];
            self.text = [self objectOrNilForKey:kStatusesText fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kStatusesCreatedAt fromDictionary:dict];
            self.inReplyToUserIdStr = [self objectOrNilForKey:kStatusesInReplyToUserIdStr fromDictionary:dict];
            self.inReplyToStatusId = [self objectOrNilForKey:kStatusesInReplyToStatusId fromDictionary:dict];
            self.contributors = [self objectOrNilForKey:kStatusesContributors fromDictionary:dict];
            self.isQuoteStatus = [[self objectOrNilForKey:kStatusesIsQuoteStatus fromDictionary:dict] boolValue];
            self.favoriteCount = [[self objectOrNilForKey:kStatusesFavoriteCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.place forKey:kStatusesPlace];
    [mutableDict setValue:self.coordinates forKey:kStatusesCoordinates];
    [mutableDict setValue:self.source forKey:kStatusesSource];
    [mutableDict setValue:[NSNumber numberWithBool:self.truncated] forKey:kStatusesTruncated];
    [mutableDict setValue:[self.metadata dictionaryRepresentation] forKey:kStatusesMetadata];
    [mutableDict setValue:[NSNumber numberWithBool:self.possiblySensitive] forKey:kStatusesPossiblySensitive];
    [mutableDict setValue:self.lang forKey:kStatusesLang];
    [mutableDict setValue:self.idStr forKey:kStatusesIdStr];
    [mutableDict setValue:self.inReplyToStatusIdStr forKey:kStatusesInReplyToStatusIdStr];
    [mutableDict setValue:[self.entities dictionaryRepresentation] forKey:kStatusesEntities];
    [mutableDict setValue:self.inReplyToScreenName forKey:kStatusesInReplyToScreenName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.retweetCount] forKey:kStatusesRetweetCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kStatusesFavorited];
    [mutableDict setValue:self.geo forKey:kStatusesGeo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesIdentifier] forKey:kStatusesId];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kStatusesUser];
    [mutableDict setValue:self.inReplyToUserId forKey:kStatusesInReplyToUserId];
    [mutableDict setValue:[self.extendedEntities dictionaryRepresentation] forKey:kStatusesExtendedEntities];
    [mutableDict setValue:[NSNumber numberWithBool:self.retweeted] forKey:kStatusesRetweeted];
    [mutableDict setValue:self.text forKey:kStatusesText];
    [mutableDict setValue:self.createdAt forKey:kStatusesCreatedAt];
    [mutableDict setValue:self.inReplyToUserIdStr forKey:kStatusesInReplyToUserIdStr];
    [mutableDict setValue:self.inReplyToStatusId forKey:kStatusesInReplyToStatusId];
    [mutableDict setValue:self.contributors forKey:kStatusesContributors];
    [mutableDict setValue:[NSNumber numberWithBool:self.isQuoteStatus] forKey:kStatusesIsQuoteStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favoriteCount] forKey:kStatusesFavoriteCount];

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

    self.place = [aDecoder decodeObjectForKey:kStatusesPlace];
    self.coordinates = [aDecoder decodeObjectForKey:kStatusesCoordinates];
    self.source = [aDecoder decodeObjectForKey:kStatusesSource];
    self.truncated = [aDecoder decodeBoolForKey:kStatusesTruncated];
    self.metadata = [aDecoder decodeObjectForKey:kStatusesMetadata];
    self.possiblySensitive = [aDecoder decodeBoolForKey:kStatusesPossiblySensitive];
    self.lang = [aDecoder decodeObjectForKey:kStatusesLang];
    self.idStr = [aDecoder decodeObjectForKey:kStatusesIdStr];
    self.inReplyToStatusIdStr = [aDecoder decodeObjectForKey:kStatusesInReplyToStatusIdStr];
    self.entities = [aDecoder decodeObjectForKey:kStatusesEntities];
    self.inReplyToScreenName = [aDecoder decodeObjectForKey:kStatusesInReplyToScreenName];
    self.retweetCount = [aDecoder decodeDoubleForKey:kStatusesRetweetCount];
    self.favorited = [aDecoder decodeBoolForKey:kStatusesFavorited];
    self.geo = [aDecoder decodeObjectForKey:kStatusesGeo];
    self.statusesIdentifier = [aDecoder decodeIntegerForKey:kStatusesId];
    self.user = [aDecoder decodeObjectForKey:kStatusesUser];
    self.inReplyToUserId = [aDecoder decodeObjectForKey:kStatusesInReplyToUserId];
    self.extendedEntities = [aDecoder decodeObjectForKey:kStatusesExtendedEntities];
    self.retweeted = [aDecoder decodeBoolForKey:kStatusesRetweeted];
    self.text = [aDecoder decodeObjectForKey:kStatusesText];
    self.createdAt = [aDecoder decodeObjectForKey:kStatusesCreatedAt];
    self.inReplyToUserIdStr = [aDecoder decodeObjectForKey:kStatusesInReplyToUserIdStr];
    self.inReplyToStatusId = [aDecoder decodeObjectForKey:kStatusesInReplyToStatusId];
    self.contributors = [aDecoder decodeObjectForKey:kStatusesContributors];
    self.isQuoteStatus = [aDecoder decodeBoolForKey:kStatusesIsQuoteStatus];
    self.favoriteCount = [aDecoder decodeDoubleForKey:kStatusesFavoriteCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_place forKey:kStatusesPlace];
    [aCoder encodeObject:_coordinates forKey:kStatusesCoordinates];
    [aCoder encodeObject:_source forKey:kStatusesSource];
    [aCoder encodeBool:_truncated forKey:kStatusesTruncated];
    [aCoder encodeObject:_metadata forKey:kStatusesMetadata];
    [aCoder encodeBool:_possiblySensitive forKey:kStatusesPossiblySensitive];
    [aCoder encodeObject:_lang forKey:kStatusesLang];
    [aCoder encodeObject:_idStr forKey:kStatusesIdStr];
    [aCoder encodeObject:_inReplyToStatusIdStr forKey:kStatusesInReplyToStatusIdStr];
    [aCoder encodeObject:_entities forKey:kStatusesEntities];
    [aCoder encodeObject:_inReplyToScreenName forKey:kStatusesInReplyToScreenName];
    [aCoder encodeDouble:_retweetCount forKey:kStatusesRetweetCount];
    [aCoder encodeBool:_favorited forKey:kStatusesFavorited];
    [aCoder encodeObject:_geo forKey:kStatusesGeo];
    [aCoder encodeInteger:_statusesIdentifier forKey:kStatusesId];
    [aCoder encodeObject:_user forKey:kStatusesUser];
    [aCoder encodeObject:_inReplyToUserId forKey:kStatusesInReplyToUserId];
    [aCoder encodeObject:_extendedEntities forKey:kStatusesExtendedEntities];
    [aCoder encodeBool:_retweeted forKey:kStatusesRetweeted];
    [aCoder encodeObject:_text forKey:kStatusesText];
    [aCoder encodeObject:_createdAt forKey:kStatusesCreatedAt];
    [aCoder encodeObject:_inReplyToUserIdStr forKey:kStatusesInReplyToUserIdStr];
    [aCoder encodeObject:_inReplyToStatusId forKey:kStatusesInReplyToStatusId];
    [aCoder encodeObject:_contributors forKey:kStatusesContributors];
    [aCoder encodeBool:_isQuoteStatus forKey:kStatusesIsQuoteStatus];
    [aCoder encodeDouble:_favoriteCount forKey:kStatusesFavoriteCount];
}

- (id)copyWithZone:(NSZone *)zone {
    Statuses *copy = [[Statuses alloc] init];
    
    
    
    if (copy) {

        copy.place = [self.place copyWithZone:zone];
        copy.coordinates = [self.coordinates copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.truncated = self.truncated;
        copy.metadata = [self.metadata copyWithZone:zone];
        copy.possiblySensitive = self.possiblySensitive;
        copy.lang = [self.lang copyWithZone:zone];
        copy.idStr = [self.idStr copyWithZone:zone];
        copy.inReplyToStatusIdStr = [self.inReplyToStatusIdStr copyWithZone:zone];
        copy.entities = [self.entities copyWithZone:zone];
        copy.inReplyToScreenName = [self.inReplyToScreenName copyWithZone:zone];
        copy.retweetCount = self.retweetCount;
        copy.favorited = self.favorited;
        copy.geo = [self.geo copyWithZone:zone];
        copy.statusesIdentifier = self.statusesIdentifier;
        copy.user = [self.user copyWithZone:zone];
        copy.inReplyToUserId = [self.inReplyToUserId copyWithZone:zone];
        copy.extendedEntities = [self.extendedEntities copyWithZone:zone];
        copy.retweeted = self.retweeted;
        copy.text = [self.text copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.inReplyToUserIdStr = [self.inReplyToUserIdStr copyWithZone:zone];
        copy.inReplyToStatusId = [self.inReplyToStatusId copyWithZone:zone];
        copy.contributors = [self.contributors copyWithZone:zone];
        copy.isQuoteStatus = self.isQuoteStatus;
        copy.favoriteCount = self.favoriteCount;
    }
    
    return copy;
}


@end
