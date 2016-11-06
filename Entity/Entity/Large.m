//
//  Large.m
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

#import "Large.h"


NSString *const kLargeW = @"w";
NSString *const kLargeH = @"h";
NSString *const kLargeResize = @"resize";


@interface Large ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Large

@synthesize w = _w;
@synthesize h = _h;
@synthesize resize = _resize;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.w = [[self objectOrNilForKey:kLargeW fromDictionary:dict] doubleValue];
            self.h = [[self objectOrNilForKey:kLargeH fromDictionary:dict] doubleValue];
            self.resize = [self objectOrNilForKey:kLargeResize fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kLargeW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kLargeH];
    [mutableDict setValue:self.resize forKey:kLargeResize];

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

    self.w = [aDecoder decodeDoubleForKey:kLargeW];
    self.h = [aDecoder decodeDoubleForKey:kLargeH];
    self.resize = [aDecoder decodeObjectForKey:kLargeResize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_w forKey:kLargeW];
    [aCoder encodeDouble:_h forKey:kLargeH];
    [aCoder encodeObject:_resize forKey:kLargeResize];
}

- (id)copyWithZone:(NSZone *)zone {
    Large *copy = [[Large alloc] init];
    
    
    
    if (copy) {

        copy.w = self.w;
        copy.h = self.h;
        copy.resize = [self.resize copyWithZone:zone];
    }
    
    return copy;
}


@end
