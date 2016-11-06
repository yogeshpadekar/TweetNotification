//
//  Metadata.h
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Metadata : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *isoLanguageCode;
@property (nonatomic, strong) NSString *resultType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
