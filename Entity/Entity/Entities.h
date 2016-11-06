//
//  Entities.h
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DescriptionClass;

@interface Entities : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *hashtags;
@property (nonatomic, strong) NSArray *symbols;
@property (nonatomic, strong) NSArray *userMentions;
@property (nonatomic, strong) NSArray *urls;
@property (nonatomic, strong) DescriptionClass *entitiesDescription;
@property (nonatomic, strong) NSArray *media;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
