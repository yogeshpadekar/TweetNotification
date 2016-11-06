//
//  Metadata.m
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
