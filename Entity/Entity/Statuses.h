//
//  Statuses.h
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
