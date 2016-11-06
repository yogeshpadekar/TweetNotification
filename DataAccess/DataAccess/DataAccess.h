//
//  DataAccess.h
//  DataAccess
//
//  Created by Yogesh on 03/11/16.
//  Copyright © 2016 Riddhesh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Entity/Tweets.h>
#import <Entity/Statuses.h>
#import <Entity/User.h>

typedef void (^TweetsCompletionBlock)(NSArray *response, NSError *error);

@interface DataAccess : NSObject {
}
+ (void)loadHashtagQueryForHashTag:(NSString *)strHashtag withCallback:(TweetsCompletionBlock)callback;

+ (void)makeLastTweetIdEmpty;
@end
