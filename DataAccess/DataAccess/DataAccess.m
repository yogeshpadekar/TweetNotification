//
//  DataAccess.m
//  DataAccess
//
//  Created by Yogesh on 03/11/16.
//  Copyright © 2016 Riddhesh. All rights reserved.
//

#import "DataAccess.h"
#import <Social/Social.h>
#import <Accounts/Accounts.h>

#define NUMBEROFTWEETS @"10"

static ACAccountStore *accountStore;
static NSString *strLastTweetId;
static void(^getTweetsResponseForHashtagCallback)(NSArray *response, NSError *error);

@interface DataAccess ()
+ (ACAccountStore *)accountStore;
+ (nullable NSString *)stringByAddingPercentEncodingForEnteredHashTag:(NSString*)strHashtag;
@end

@implementation DataAccess

+ (ACAccountStore *)accountStore
{
    if (accountStore == nil)
    {
        accountStore = [[ACAccountStore alloc] init];
    }
    return accountStore;
}

+ (void)makeLastTweetIdEmpty {
    strLastTweetId = nil;
}

///Method to pass a query string to search for
+ (nullable NSString *)stringByAddingPercentEncodingForEnteredHashTag:(NSString*)strHashtag {
    NSString *unreserved = @"*-._";
    NSMutableCharacterSet *allowedCharacterSet = [NSMutableCharacterSet alphanumericCharacterSet];
    [allowedCharacterSet addCharactersInString:unreserved];
    NSString *strEncoded = [[NSString stringWithFormat:@"#%@",strHashtag]
                            stringByAddingPercentEncodingWithAllowedCharacters: allowedCharacterSet];
    return strEncoded;
}

+ (void)loadHashtagQueryForHashTag:(NSString *)strHashtag withCallback:(TweetsCompletionBlock)callback {
    getTweetsResponseForHashtagCallback = callback;
    
    NSString *strEncodedQuery = [self stringByAddingPercentEncodingForEnteredHashTag:strHashtag];
    ACAccountType *accountType = [self.accountStore accountTypeWithAccountTypeIdentifier:
                                  ACAccountTypeIdentifierTwitter];
    [accountStore requestAccessToAccountsWithType:accountType
                                          options:NULL
                                       completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
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
                                               strLastTweetId = dictTweets[@"search_metadata"][@"max_id_str"];
                                               
                                               Tweets *objTweets = [Tweets modelObjectWithDictionary:dictTweets];
                                               NSArray *arrResponse = [NSArray arrayWithObjects: dictTweets
                                                                       [@"search_metadata"][@"since_id_str"],
                                                                       objTweets.statuses, nil];
                                               getTweetsResponseForHashtagCallback(arrResponse, error);

                                           }];
             [task resume];
         }
//         else
//         {
//        }
     }];

}

+ (void)loadHashtagQueryForHashTag:(NSString*)strHashtag
{
    NSString *strEncodedQuery = [self stringByAddingPercentEncodingForEnteredHashTag:strHashtag];
    ACAccountType *accountType = [self.accountStore accountTypeWithAccountTypeIdentifier:
                                  ACAccountTypeIdentifierTwitter];
    [accountStore requestAccessToAccountsWithType:accountType
                                          options:NULL
                                       completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
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
                                               dispatch_async(dispatch_get_main_queue(), ^{
                                               });
                                               
                                               NSDictionary* dictTweets = [NSJSONSerialization JSONObjectWithData:data
                                                                                                    options:NSJSONReadingAllowFragments
                                                                                                      error:&error];
                                               Tweets *objTweets = [Tweets modelObjectWithDictionary:dictTweets];
                                               
                                           }];
             
             [task resume];
         }
         else
         {
             dispatch_async(dispatch_get_main_queue(), ^{
             });
         }
     }];
}

@end
