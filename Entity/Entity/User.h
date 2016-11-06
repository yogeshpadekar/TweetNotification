//
//  User.h
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

@class Entities;

@interface User : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL protectedProperty;
@property (nonatomic, assign) BOOL isTranslator;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) NSInteger userIdentifier;
@property (nonatomic, assign) BOOL defaultProfileImage;
@property (nonatomic, assign) double listedCount;
@property (nonatomic, strong) NSString *profileBackgroundColor;
@property (nonatomic, assign) BOOL followRequestSent;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *lang;
@property (nonatomic, strong) id url;
@property (nonatomic, strong) Entities *entities;
@property (nonatomic, assign) BOOL geoEnabled;
@property (nonatomic, assign) double followersCount;
@property (nonatomic, strong) NSString *profileTextColor;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, assign) double statusesCount;
@property (nonatomic, assign) BOOL notifications;
@property (nonatomic, assign) BOOL following;
@property (nonatomic, assign) BOOL profileBackgroundTile;
@property (nonatomic, assign) BOOL profileUseBackgroundImage;
@property (nonatomic, strong) NSString *profileSidebarFillColor;
@property (nonatomic, strong) NSString *profileImageUrlHttps;
@property (nonatomic, assign) BOOL defaultProfile;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *profileSidebarBorderColor;
@property (nonatomic, assign) BOOL contributorsEnabled;
@property (nonatomic, strong) NSString *idStr;
@property (nonatomic, strong) NSString *profileBannerUrl;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) id timeZone;
@property (nonatomic, strong) id profileBackgroundImageUrl;
@property (nonatomic, strong) id profileBackgroundImageUrlHttps;
@property (nonatomic, strong) NSString *profileLinkColor;
@property (nonatomic, assign) double favouritesCount;
@property (nonatomic, assign) BOOL isTranslationEnabled;
@property (nonatomic, strong) NSString *translatorType;
@property (nonatomic, strong) id utcOffset;
@property (nonatomic, assign) double friendsCount;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, assign) BOOL hasExtendedProfile;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
