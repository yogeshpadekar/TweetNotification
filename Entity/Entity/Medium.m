//
//  Medium.m
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
#import "Medium.h"


NSString *const kMediumW = @"w";
NSString *const kMediumH = @"h";
NSString *const kMediumResize = @"resize";


@interface Medium ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Medium

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
            self.w = [[self objectOrNilForKey:kMediumW fromDictionary:dict] doubleValue];
            self.h = [[self objectOrNilForKey:kMediumH fromDictionary:dict] doubleValue];
            self.resize = [self objectOrNilForKey:kMediumResize fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.w] forKey:kMediumW];
    [mutableDict setValue:[NSNumber numberWithDouble:self.h] forKey:kMediumH];
    [mutableDict setValue:self.resize forKey:kMediumResize];

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

    self.w = [aDecoder decodeDoubleForKey:kMediumW];
    self.h = [aDecoder decodeDoubleForKey:kMediumH];
    self.resize = [aDecoder decodeObjectForKey:kMediumResize];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_w forKey:kMediumW];
    [aCoder encodeDouble:_h forKey:kMediumH];
    [aCoder encodeObject:_resize forKey:kMediumResize];
}

- (id)copyWithZone:(NSZone *)zone {
    Medium *copy = [[Medium alloc] init];
    
    
    
    if (copy) {

        copy.w = self.w;
        copy.h = self.h;
        copy.resize = [self.resize copyWithZone:zone];
    }
    
    return copy;
}


@end
