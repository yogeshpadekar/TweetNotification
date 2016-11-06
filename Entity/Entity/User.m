//
//  User.m
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

#import "User.h"
#import "Entities.h"


NSString *const kUserProtected = @"protected";
NSString *const kUserIsTranslator = @"is_translator";
NSString *const kUserProfileImageUrl = @"profile_image_url";
NSString *const kUserCreatedAt = @"created_at";
NSString *const kUserId = @"id";
NSString *const kUserDefaultProfileImage = @"default_profile_image";
NSString *const kUserListedCount = @"listed_count";
NSString *const kUserProfileBackgroundColor = @"profile_background_color";
NSString *const kUserFollowRequestSent = @"follow_request_sent";
NSString *const kUserLocation = @"location";
NSString *const kUserLang = @"lang";
NSString *const kUserUrl = @"url";
NSString *const kUserEntities = @"entities";
NSString *const kUserGeoEnabled = @"geo_enabled";
NSString *const kUserFollowersCount = @"followers_count";
NSString *const kUserProfileTextColor = @"profile_text_color";
NSString *const kUserDescription = @"description";
NSString *const kUserStatusesCount = @"statuses_count";
NSString *const kUserNotifications = @"notifications";
NSString *const kUserFollowing = @"following";
NSString *const kUserProfileBackgroundTile = @"profile_background_tile";
NSString *const kUserProfileUseBackgroundImage = @"profile_use_background_image";
NSString *const kUserProfileSidebarFillColor = @"profile_sidebar_fill_color";
NSString *const kUserProfileImageUrlHttps = @"profile_image_url_https";
NSString *const kUserDefaultProfile = @"default_profile";
NSString *const kUserName = @"name";
NSString *const kUserProfileSidebarBorderColor = @"profile_sidebar_border_color";
NSString *const kUserContributorsEnabled = @"contributors_enabled";
NSString *const kUserIdStr = @"id_str";
NSString *const kUserProfileBannerUrl = @"profile_banner_url";
NSString *const kUserScreenName = @"screen_name";
NSString *const kUserTimeZone = @"time_zone";
NSString *const kUserProfileBackgroundImageUrl = @"profile_background_image_url";
NSString *const kUserProfileBackgroundImageUrlHttps = @"profile_background_image_url_https";
NSString *const kUserProfileLinkColor = @"profile_link_color";
NSString *const kUserFavouritesCount = @"favourites_count";
NSString *const kUserIsTranslationEnabled = @"is_translation_enabled";
NSString *const kUserTranslatorType = @"translator_type";
NSString *const kUserUtcOffset = @"utc_offset";
NSString *const kUserFriendsCount = @"friends_count";
NSString *const kUserVerified = @"verified";
NSString *const kUserHasExtendedProfile = @"has_extended_profile";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

@synthesize protectedProperty = _protectedProperty;
@synthesize isTranslator = _isTranslator;
@synthesize profileImageUrl = _profileImageUrl;
@synthesize createdAt = _createdAt;
@synthesize userIdentifier = _userIdentifier;
@synthesize defaultProfileImage = _defaultProfileImage;
@synthesize listedCount = _listedCount;
@synthesize profileBackgroundColor = _profileBackgroundColor;
@synthesize followRequestSent = _followRequestSent;
@synthesize location = _location;
@synthesize lang = _lang;
@synthesize url = _url;
@synthesize entities = _entities;
@synthesize geoEnabled = _geoEnabled;
@synthesize followersCount = _followersCount;
@synthesize profileTextColor = _profileTextColor;
@synthesize userDescription = _userDescription;
@synthesize statusesCount = _statusesCount;
@synthesize notifications = _notifications;
@synthesize following = _following;
@synthesize profileBackgroundTile = _profileBackgroundTile;
@synthesize profileUseBackgroundImage = _profileUseBackgroundImage;
@synthesize profileSidebarFillColor = _profileSidebarFillColor;
@synthesize profileImageUrlHttps = _profileImageUrlHttps;
@synthesize defaultProfile = _defaultProfile;
@synthesize name = _name;
@synthesize profileSidebarBorderColor = _profileSidebarBorderColor;
@synthesize contributorsEnabled = _contributorsEnabled;
@synthesize idStr = _idStr;
@synthesize profileBannerUrl = _profileBannerUrl;
@synthesize screenName = _screenName;
@synthesize timeZone = _timeZone;
@synthesize profileBackgroundImageUrl = _profileBackgroundImageUrl;
@synthesize profileBackgroundImageUrlHttps = _profileBackgroundImageUrlHttps;
@synthesize profileLinkColor = _profileLinkColor;
@synthesize favouritesCount = _favouritesCount;
@synthesize isTranslationEnabled = _isTranslationEnabled;
@synthesize translatorType = _translatorType;
@synthesize utcOffset = _utcOffset;
@synthesize friendsCount = _friendsCount;
@synthesize verified = _verified;
@synthesize hasExtendedProfile = _hasExtendedProfile;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.protectedProperty = [[self objectOrNilForKey:kUserProtected fromDictionary:dict] boolValue];
            self.isTranslator = [[self objectOrNilForKey:kUserIsTranslator fromDictionary:dict] boolValue];
            self.profileImageUrl = [self objectOrNilForKey:kUserProfileImageUrl fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kUserCreatedAt fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kUserId fromDictionary:dict] intValue];
            self.defaultProfileImage = [[self objectOrNilForKey:kUserDefaultProfileImage fromDictionary:dict] boolValue];
            self.listedCount = [[self objectOrNilForKey:kUserListedCount fromDictionary:dict] doubleValue];
            self.profileBackgroundColor = [self objectOrNilForKey:kUserProfileBackgroundColor fromDictionary:dict];
            self.followRequestSent = [[self objectOrNilForKey:kUserFollowRequestSent fromDictionary:dict] boolValue];
            self.location = [self objectOrNilForKey:kUserLocation fromDictionary:dict];
            self.lang = [self objectOrNilForKey:kUserLang fromDictionary:dict];
            self.url = [self objectOrNilForKey:kUserUrl fromDictionary:dict];
            self.entities = [Entities modelObjectWithDictionary:[dict objectForKey:kUserEntities]];
            self.geoEnabled = [[self objectOrNilForKey:kUserGeoEnabled fromDictionary:dict] boolValue];
            self.followersCount = [[self objectOrNilForKey:kUserFollowersCount fromDictionary:dict] doubleValue];
            self.profileTextColor = [self objectOrNilForKey:kUserProfileTextColor fromDictionary:dict];
            self.userDescription = [self objectOrNilForKey:kUserDescription fromDictionary:dict];
            self.statusesCount = [[self objectOrNilForKey:kUserStatusesCount fromDictionary:dict] doubleValue];
            self.notifications = [[self objectOrNilForKey:kUserNotifications fromDictionary:dict] boolValue];
            self.following = [[self objectOrNilForKey:kUserFollowing fromDictionary:dict] boolValue];
            self.profileBackgroundTile = [[self objectOrNilForKey:kUserProfileBackgroundTile fromDictionary:dict] boolValue];
            self.profileUseBackgroundImage = [[self objectOrNilForKey:kUserProfileUseBackgroundImage fromDictionary:dict] boolValue];
            self.profileSidebarFillColor = [self objectOrNilForKey:kUserProfileSidebarFillColor fromDictionary:dict];
            self.profileImageUrlHttps = [self objectOrNilForKey:kUserProfileImageUrlHttps fromDictionary:dict];
            self.defaultProfile = [[self objectOrNilForKey:kUserDefaultProfile fromDictionary:dict] boolValue];
            self.name = [self objectOrNilForKey:kUserName fromDictionary:dict];
            self.profileSidebarBorderColor = [self objectOrNilForKey:kUserProfileSidebarBorderColor fromDictionary:dict];
            self.contributorsEnabled = [[self objectOrNilForKey:kUserContributorsEnabled fromDictionary:dict] boolValue];
            self.idStr = [self objectOrNilForKey:kUserIdStr fromDictionary:dict];
            self.profileBannerUrl = [self objectOrNilForKey:kUserProfileBannerUrl fromDictionary:dict];
            self.screenName = [self objectOrNilForKey:kUserScreenName fromDictionary:dict];
            self.timeZone = [self objectOrNilForKey:kUserTimeZone fromDictionary:dict];
            self.profileBackgroundImageUrl = [self objectOrNilForKey:kUserProfileBackgroundImageUrl fromDictionary:dict];
            self.profileBackgroundImageUrlHttps = [self objectOrNilForKey:kUserProfileBackgroundImageUrlHttps fromDictionary:dict];
            self.profileLinkColor = [self objectOrNilForKey:kUserProfileLinkColor fromDictionary:dict];
            self.favouritesCount = [[self objectOrNilForKey:kUserFavouritesCount fromDictionary:dict] doubleValue];
            self.isTranslationEnabled = [[self objectOrNilForKey:kUserIsTranslationEnabled fromDictionary:dict] boolValue];
            self.translatorType = [self objectOrNilForKey:kUserTranslatorType fromDictionary:dict];
            self.utcOffset = [self objectOrNilForKey:kUserUtcOffset fromDictionary:dict];
            self.friendsCount = [[self objectOrNilForKey:kUserFriendsCount fromDictionary:dict] doubleValue];
            self.verified = [[self objectOrNilForKey:kUserVerified fromDictionary:dict] boolValue];
            self.hasExtendedProfile = [[self objectOrNilForKey:kUserHasExtendedProfile fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.protectedProperty] forKey:kUserProtected];
    [mutableDict setValue:[NSNumber numberWithBool:self.isTranslator] forKey:kUserIsTranslator];
    [mutableDict setValue:self.profileImageUrl forKey:kUserProfileImageUrl];
    [mutableDict setValue:self.createdAt forKey:kUserCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kUserId];
    [mutableDict setValue:[NSNumber numberWithBool:self.defaultProfileImage] forKey:kUserDefaultProfileImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.listedCount] forKey:kUserListedCount];
    [mutableDict setValue:self.profileBackgroundColor forKey:kUserProfileBackgroundColor];
    [mutableDict setValue:[NSNumber numberWithBool:self.followRequestSent] forKey:kUserFollowRequestSent];
    [mutableDict setValue:self.location forKey:kUserLocation];
    [mutableDict setValue:self.lang forKey:kUserLang];
    [mutableDict setValue:self.url forKey:kUserUrl];
    [mutableDict setValue:[self.entities dictionaryRepresentation] forKey:kUserEntities];
    [mutableDict setValue:[NSNumber numberWithBool:self.geoEnabled] forKey:kUserGeoEnabled];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCount] forKey:kUserFollowersCount];
    [mutableDict setValue:self.profileTextColor forKey:kUserProfileTextColor];
    [mutableDict setValue:self.userDescription forKey:kUserDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesCount] forKey:kUserStatusesCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.notifications] forKey:kUserNotifications];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kUserFollowing];
    [mutableDict setValue:[NSNumber numberWithBool:self.profileBackgroundTile] forKey:kUserProfileBackgroundTile];
    [mutableDict setValue:[NSNumber numberWithBool:self.profileUseBackgroundImage] forKey:kUserProfileUseBackgroundImage];
    [mutableDict setValue:self.profileSidebarFillColor forKey:kUserProfileSidebarFillColor];
    [mutableDict setValue:self.profileImageUrlHttps forKey:kUserProfileImageUrlHttps];
    [mutableDict setValue:[NSNumber numberWithBool:self.defaultProfile] forKey:kUserDefaultProfile];
    [mutableDict setValue:self.name forKey:kUserName];
    [mutableDict setValue:self.profileSidebarBorderColor forKey:kUserProfileSidebarBorderColor];
    [mutableDict setValue:[NSNumber numberWithBool:self.contributorsEnabled] forKey:kUserContributorsEnabled];
    [mutableDict setValue:self.idStr forKey:kUserIdStr];
    [mutableDict setValue:self.profileBannerUrl forKey:kUserProfileBannerUrl];
    [mutableDict setValue:self.screenName forKey:kUserScreenName];
    [mutableDict setValue:self.timeZone forKey:kUserTimeZone];
    [mutableDict setValue:self.profileBackgroundImageUrl forKey:kUserProfileBackgroundImageUrl];
    [mutableDict setValue:self.profileBackgroundImageUrlHttps forKey:kUserProfileBackgroundImageUrlHttps];
    [mutableDict setValue:self.profileLinkColor forKey:kUserProfileLinkColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favouritesCount] forKey:kUserFavouritesCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.isTranslationEnabled] forKey:kUserIsTranslationEnabled];
    [mutableDict setValue:self.translatorType forKey:kUserTranslatorType];
    [mutableDict setValue:self.utcOffset forKey:kUserUtcOffset];
    [mutableDict setValue:[NSNumber numberWithDouble:self.friendsCount] forKey:kUserFriendsCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kUserVerified];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasExtendedProfile] forKey:kUserHasExtendedProfile];

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

    self.protectedProperty = [aDecoder decodeBoolForKey:kUserProtected];
    self.isTranslator = [aDecoder decodeBoolForKey:kUserIsTranslator];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kUserProfileImageUrl];
    self.createdAt = [aDecoder decodeObjectForKey:kUserCreatedAt];
    self.userIdentifier = [aDecoder decodeIntegerForKey:kUserId];
    self.defaultProfileImage = [aDecoder decodeBoolForKey:kUserDefaultProfileImage];
    self.listedCount = [aDecoder decodeDoubleForKey:kUserListedCount];
    self.profileBackgroundColor = [aDecoder decodeObjectForKey:kUserProfileBackgroundColor];
    self.followRequestSent = [aDecoder decodeBoolForKey:kUserFollowRequestSent];
    self.location = [aDecoder decodeObjectForKey:kUserLocation];
    self.lang = [aDecoder decodeObjectForKey:kUserLang];
    self.url = [aDecoder decodeObjectForKey:kUserUrl];
    self.entities = [aDecoder decodeObjectForKey:kUserEntities];
    self.geoEnabled = [aDecoder decodeBoolForKey:kUserGeoEnabled];
    self.followersCount = [aDecoder decodeDoubleForKey:kUserFollowersCount];
    self.profileTextColor = [aDecoder decodeObjectForKey:kUserProfileTextColor];
    self.userDescription = [aDecoder decodeObjectForKey:kUserDescription];
    self.statusesCount = [aDecoder decodeDoubleForKey:kUserStatusesCount];
    self.notifications = [aDecoder decodeBoolForKey:kUserNotifications];
    self.following = [aDecoder decodeBoolForKey:kUserFollowing];
    self.profileBackgroundTile = [aDecoder decodeBoolForKey:kUserProfileBackgroundTile];
    self.profileUseBackgroundImage = [aDecoder decodeBoolForKey:kUserProfileUseBackgroundImage];
    self.profileSidebarFillColor = [aDecoder decodeObjectForKey:kUserProfileSidebarFillColor];
    self.profileImageUrlHttps = [aDecoder decodeObjectForKey:kUserProfileImageUrlHttps];
    self.defaultProfile = [aDecoder decodeBoolForKey:kUserDefaultProfile];
    self.name = [aDecoder decodeObjectForKey:kUserName];
    self.profileSidebarBorderColor = [aDecoder decodeObjectForKey:kUserProfileSidebarBorderColor];
    self.contributorsEnabled = [aDecoder decodeBoolForKey:kUserContributorsEnabled];
    self.idStr = [aDecoder decodeObjectForKey:kUserIdStr];
    self.profileBannerUrl = [aDecoder decodeObjectForKey:kUserProfileBannerUrl];
    self.screenName = [aDecoder decodeObjectForKey:kUserScreenName];
    self.timeZone = [aDecoder decodeObjectForKey:kUserTimeZone];
    self.profileBackgroundImageUrl = [aDecoder decodeObjectForKey:kUserProfileBackgroundImageUrl];
    self.profileBackgroundImageUrlHttps = [aDecoder decodeObjectForKey:kUserProfileBackgroundImageUrlHttps];
    self.profileLinkColor = [aDecoder decodeObjectForKey:kUserProfileLinkColor];
    self.favouritesCount = [aDecoder decodeDoubleForKey:kUserFavouritesCount];
    self.isTranslationEnabled = [aDecoder decodeBoolForKey:kUserIsTranslationEnabled];
    self.translatorType = [aDecoder decodeObjectForKey:kUserTranslatorType];
    self.utcOffset = [aDecoder decodeObjectForKey:kUserUtcOffset];
    self.friendsCount = [aDecoder decodeDoubleForKey:kUserFriendsCount];
    self.verified = [aDecoder decodeBoolForKey:kUserVerified];
    self.hasExtendedProfile = [aDecoder decodeBoolForKey:kUserHasExtendedProfile];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_protectedProperty forKey:kUserProtected];
    [aCoder encodeBool:_isTranslator forKey:kUserIsTranslator];
    [aCoder encodeObject:_profileImageUrl forKey:kUserProfileImageUrl];
    [aCoder encodeObject:_createdAt forKey:kUserCreatedAt];
    [aCoder encodeInteger:_userIdentifier forKey:kUserId];
    [aCoder encodeBool:_defaultProfileImage forKey:kUserDefaultProfileImage];
    [aCoder encodeDouble:_listedCount forKey:kUserListedCount];
    [aCoder encodeObject:_profileBackgroundColor forKey:kUserProfileBackgroundColor];
    [aCoder encodeBool:_followRequestSent forKey:kUserFollowRequestSent];
    [aCoder encodeObject:_location forKey:kUserLocation];
    [aCoder encodeObject:_lang forKey:kUserLang];
    [aCoder encodeObject:_url forKey:kUserUrl];
    [aCoder encodeObject:_entities forKey:kUserEntities];
    [aCoder encodeBool:_geoEnabled forKey:kUserGeoEnabled];
    [aCoder encodeDouble:_followersCount forKey:kUserFollowersCount];
    [aCoder encodeObject:_profileTextColor forKey:kUserProfileTextColor];
    [aCoder encodeObject:_userDescription forKey:kUserDescription];
    [aCoder encodeDouble:_statusesCount forKey:kUserStatusesCount];
    [aCoder encodeBool:_notifications forKey:kUserNotifications];
    [aCoder encodeBool:_following forKey:kUserFollowing];
    [aCoder encodeBool:_profileBackgroundTile forKey:kUserProfileBackgroundTile];
    [aCoder encodeBool:_profileUseBackgroundImage forKey:kUserProfileUseBackgroundImage];
    [aCoder encodeObject:_profileSidebarFillColor forKey:kUserProfileSidebarFillColor];
    [aCoder encodeObject:_profileImageUrlHttps forKey:kUserProfileImageUrlHttps];
    [aCoder encodeBool:_defaultProfile forKey:kUserDefaultProfile];
    [aCoder encodeObject:_name forKey:kUserName];
    [aCoder encodeObject:_profileSidebarBorderColor forKey:kUserProfileSidebarBorderColor];
    [aCoder encodeBool:_contributorsEnabled forKey:kUserContributorsEnabled];
    [aCoder encodeObject:_idStr forKey:kUserIdStr];
    [aCoder encodeObject:_profileBannerUrl forKey:kUserProfileBannerUrl];
    [aCoder encodeObject:_screenName forKey:kUserScreenName];
    [aCoder encodeObject:_timeZone forKey:kUserTimeZone];
    [aCoder encodeObject:_profileBackgroundImageUrl forKey:kUserProfileBackgroundImageUrl];
    [aCoder encodeObject:_profileBackgroundImageUrlHttps forKey:kUserProfileBackgroundImageUrlHttps];
    [aCoder encodeObject:_profileLinkColor forKey:kUserProfileLinkColor];
    [aCoder encodeDouble:_favouritesCount forKey:kUserFavouritesCount];
    [aCoder encodeBool:_isTranslationEnabled forKey:kUserIsTranslationEnabled];
    [aCoder encodeObject:_translatorType forKey:kUserTranslatorType];
    [aCoder encodeObject:_utcOffset forKey:kUserUtcOffset];
    [aCoder encodeDouble:_friendsCount forKey:kUserFriendsCount];
    [aCoder encodeBool:_verified forKey:kUserVerified];
    [aCoder encodeBool:_hasExtendedProfile forKey:kUserHasExtendedProfile];
}

- (id)copyWithZone:(NSZone *)zone {
    User *copy = [[User alloc] init];
    
    
    
    if (copy) {

        copy.protectedProperty = self.protectedProperty;
        copy.isTranslator = self.isTranslator;
        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.userIdentifier = self.userIdentifier;
        copy.defaultProfileImage = self.defaultProfileImage;
        copy.listedCount = self.listedCount;
        copy.profileBackgroundColor = [self.profileBackgroundColor copyWithZone:zone];
        copy.followRequestSent = self.followRequestSent;
        copy.location = [self.location copyWithZone:zone];
        copy.lang = [self.lang copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.entities = [self.entities copyWithZone:zone];
        copy.geoEnabled = self.geoEnabled;
        copy.followersCount = self.followersCount;
        copy.profileTextColor = [self.profileTextColor copyWithZone:zone];
        copy.userDescription = [self.userDescription copyWithZone:zone];
        copy.statusesCount = self.statusesCount;
        copy.notifications = self.notifications;
        copy.following = self.following;
        copy.profileBackgroundTile = self.profileBackgroundTile;
        copy.profileUseBackgroundImage = self.profileUseBackgroundImage;
        copy.profileSidebarFillColor = [self.profileSidebarFillColor copyWithZone:zone];
        copy.profileImageUrlHttps = [self.profileImageUrlHttps copyWithZone:zone];
        copy.defaultProfile = self.defaultProfile;
        copy.name = [self.name copyWithZone:zone];
        copy.profileSidebarBorderColor = [self.profileSidebarBorderColor copyWithZone:zone];
        copy.contributorsEnabled = self.contributorsEnabled;
        copy.idStr = [self.idStr copyWithZone:zone];
        copy.profileBannerUrl = [self.profileBannerUrl copyWithZone:zone];
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.timeZone = [self.timeZone copyWithZone:zone];
        copy.profileBackgroundImageUrl = [self.profileBackgroundImageUrl copyWithZone:zone];
        copy.profileBackgroundImageUrlHttps = [self.profileBackgroundImageUrlHttps copyWithZone:zone];
        copy.profileLinkColor = [self.profileLinkColor copyWithZone:zone];
        copy.favouritesCount = self.favouritesCount;
        copy.isTranslationEnabled = self.isTranslationEnabled;
        copy.translatorType = [self.translatorType copyWithZone:zone];
        copy.utcOffset = [self.utcOffset copyWithZone:zone];
        copy.friendsCount = self.friendsCount;
        copy.verified = self.verified;
        copy.hasExtendedProfile = self.hasExtendedProfile;
    }
    
    return copy;
}


@end
