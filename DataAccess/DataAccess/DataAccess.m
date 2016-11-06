//
//  DataAccess.m
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

#import "DataAccess.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

#define NUMBEROFTWEETS @"10"

static ACAccountStore *accountStore;
static NSString *strLastTweetId;
static void(^getTweetsResponseForHashtagCallback)(NSArray *response, NSError *error);

@interface DataAccess ()

///Method to create an object of class ACAccountStore
+ (ACAccountStore *)accountStore;

///Method to create a valid hashtag to search for
+ (nullable NSString *)stringByAddingPercentEncodingForEnteredHashTag:(NSString*)strHashtag;
@end

@implementation DataAccess

///Method to check if the twitter account is configured
+ (BOOL)twitterAccountConfigured {
    ACAccountType *accountType = [self.accountStore accountTypeWithAccountTypeIdentifier:
                                  ACAccountTypeIdentifierTwitter];
    NSArray *accounts = [self.accountStore accountsWithAccountType:accountType];
    return accounts.count > 0;
}

///Method to create an object of class ACAccountStore
+ (ACAccountStore *)accountStore
{
    if (accountStore == nil)
    {
        accountStore = [[ACAccountStore alloc] init];
    }
    return accountStore;
}

///Method to set the identifier storing id of last tweet to empty
+ (void)makeLastTweetIdEmpty {
    strLastTweetId = nil;
}

///Method to create a valid hashtag to search for
+ (nullable NSString *)stringByAddingPercentEncodingForEnteredHashTag:(NSString*)strHashtag {
    NSString *unreserved = @"*-._";
    NSMutableCharacterSet *allowedCharacterSet = [NSMutableCharacterSet alphanumericCharacterSet];
    [allowedCharacterSet addCharactersInString:unreserved];
    NSString *strEncoded = [[NSString stringWithFormat:@"#%@",strHashtag]
                            stringByAddingPercentEncodingWithAllowedCharacters: allowedCharacterSet];
    return strEncoded;
}

///Method to fetch recent tweets for given hashtag
+ (void)loadHashtagQueryForHashTag:(NSString *)strHashtag withCallback:(TweetsCompletionBlock)callback {
    getTweetsResponseForHashtagCallback = callback;
    
    NSString *strEncodedQuery = [self stringByAddingPercentEncodingForEnteredHashTag:strHashtag];
    ACAccountType *accountType = [self.accountStore accountTypeWithAccountTypeIdentifier:
                                  ACAccountTypeIdentifierTwitter];
    [accountStore requestAccessToAccountsWithType:accountType
                                          options:NULL
                                       completion:^(BOOL granted, NSError *error) {
                                           if (granted) {
                                               //call twitter search api
                                               NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/search/tweets.json"];
                                               NSDictionary *parameters = @{@"count" : NUMBEROFTWEETS,
                                                                            @"q" : strEncodedQuery,
                                                                            @"since_id" : (strLastTweetId ? strLastTweetId :@"")};
                                               
                                               SLRequest *slRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                                                                         requestMethod:SLRequestMethodGET
                                                                                                   URL:url
                                                                                            parameters:parameters];
                                               
                                               NSArray *accounts = [self.accountStore accountsWithAccountType:accountType];
                                               slRequest.account = [accounts lastObject];
                                               NSURLRequest *request = [slRequest preparedURLRequest];
                                               
                                               NSURLSession *session = [NSURLSession sharedSession];
                                               NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                                                       completionHandler:
                                                                             ^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                                 
                                                                                 if(!data)
                                                                                     return;
                                                                                 
                                                                                 NSDictionary* dictTweets = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                                            options:NSJSONReadingAllowFragments
                                                                                                                                              error:&error];
                                                                                 //Save the last tweet id so that we can use it while we call
                                                                                 //for the search api in background
                                                                                 strLastTweetId = dictTweets[@"search_metadata"][@"max_id_str"];
                                                                                 
                                                                                 Tweets *objTweets = [Tweets modelObjectWithDictionary:dictTweets];
                                                                                 NSArray *arrResponse = [NSArray arrayWithObjects: dictTweets
                                                                                                         [@"search_metadata"][@"since_id_str"],
                                                                                                         objTweets.statuses, nil];
                                                                                 getTweetsResponseForHashtagCallback(arrResponse, error);
                                                                                 
                                                                             }];
                                               [task resume];
                                           }
                                       }];
    
}

@end
