//
//  Metadata.m
//
//  Created by macmini  on 05/11/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Metadata.h"


NSString *const kMetadataIsoLanguageCode = @"iso_language_code";
NSString *const kMetadataResultType = @"result_type";


@interface Metadata ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Metadata

@synthesize isoLanguageCode = _isoLanguageCode;
@synthesize resultType = _resultType;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isoLanguageCode = [self objectOrNilForKey:kMetadataIsoLanguageCode fromDictionary:dict];
            self.resultType = [self objectOrNilForKey:kMetadataResultType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.isoLanguageCode forKey:kMetadataIsoLanguageCode];
    [mutableDict setValue:self.resultType forKey:kMetadataResultType];

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

    self.isoLanguageCode = [aDecoder decodeObjectForKey:kMetadataIsoLanguageCode];
    self.resultType = [aDecoder decodeObjectForKey:kMetadataResultType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_isoLanguageCode forKey:kMetadataIsoLanguageCode];
    [aCoder encodeObject:_resultType forKey:kMetadataResultType];
}

- (id)copyWithZone:(NSZone *)zone {
    Metadata *copy = [[Metadata alloc] init];
    
    
    
    if (copy) {

        copy.isoLanguageCode = [self.isoLanguageCode copyWithZone:zone];
        copy.resultType = [self.resultType copyWithZone:zone];
    }
    
    return copy;
}


@end
