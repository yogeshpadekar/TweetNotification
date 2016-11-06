//
//  Sizes.h
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Large, Medium, Thumb, Small;

@interface Sizes : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Large *large;
@property (nonatomic, strong) Medium *medium;
@property (nonatomic, strong) Thumb *thumb;
@property (nonatomic, strong) Small *small;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
