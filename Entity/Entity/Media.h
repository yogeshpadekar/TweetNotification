//
//  Media.h
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Sizes;

@interface Media : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *idStr;
@property (nonatomic, strong) NSString *mediaUrlHttps;
@property (nonatomic, strong) NSString *mediaUrl;
@property (nonatomic, assign) NSInteger mediaIdentifier;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *displayUrl;
@property (nonatomic, strong) Sizes *sizes;
@property (nonatomic, strong) NSArray *indices;
@property (nonatomic, strong) NSString *expandedUrl;
@property (nonatomic, strong) NSString *type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
