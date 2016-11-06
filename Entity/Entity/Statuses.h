//
//  Statuses.h
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Metadata, Entities, User, ExtendedEntities;

@interface Statuses : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) id place;
@property (nonatomic, strong) id coordinates;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) BOOL truncated;
@property (nonatomic, strong) Metadata *metadata;
@property (nonatomic, assign) BOOL possiblySensitive;
@property (nonatomic, strong) NSString *lang;
@property (nonatomic, strong) NSString *idStr;
@property (nonatomic, strong) id inReplyToStatusIdStr;
@property (nonatomic, strong) Entities *entities;
@property (nonatomic, strong) id inReplyToScreenName;
@property (nonatomic, assign) double retweetCount;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, strong) id geo;
@property (nonatomic, assign) NSInteger statusesIdentifier;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) id inReplyToUserId;
@property (nonatomic, strong) ExtendedEntities *extendedEntities;
@property (nonatomic, assign) BOOL retweeted;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) id inReplyToUserIdStr;
@property (nonatomic, strong) id inReplyToStatusId;
@property (nonatomic, strong) id contributors;
@property (nonatomic, assign) BOOL isQuoteStatus;
@property (nonatomic, assign) double favoriteCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
