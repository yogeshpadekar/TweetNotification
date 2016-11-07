//
//  DataAccess.h
//  DataAccess
//
//  Created by Yogesh on 03/11/16.
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

#import <Foundation/Foundation.h>
#import <Entity/Tweets.h>
#import <Entity/Statuses.h>
#import <Entity/User.h>

typedef void (^TweetsCompletionBlock)(NSArray *response, NSError *error);

@interface DataAccess : NSObject {
}

///Method to fetch recent tweets for given hashtag
+ (void)loadHashtagQueryForHashTag:(NSString *)strHashtag withCallback:(TweetsCompletionBlock)callback;

///Method to set the identifier storing id of last tweet to empty
+ (void)makeLastTweetIdEmpty;

@end
