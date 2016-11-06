//
//  Thumb.h
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Thumb : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double w;
@property (nonatomic, assign) double h;
@property (nonatomic, strong) NSString *resize;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
