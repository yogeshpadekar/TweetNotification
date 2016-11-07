//
//  AppDelegate.m
//  TweetNotification
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


#import "AppDelegate.h"
#import <DataAccess/DataAccess.h>

@interface AppDelegate ()
- (void)setNotificationForStatus:(Statuses*)objStatus;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Register for local notifications
    [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:
                                                   UIUserNotificationTypeAlert|
                                                   UIUserNotificationTypeSound categories:nil]];

    //set the minimum duration for background fetch
    [application setMinimumBackgroundFetchInterval:5.0];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application performFetchWithCompletionHandler:
(void (^)(UIBackgroundFetchResult))completionHandler{
    
    if(!self.strHashtag)
        return;
    
    //Call the tweets for given hashtag and if there is any new tweet then set the notifications for tham
    [DataAccess loadHashtagQueryForHashTag:self.strHashtag withCallback:^(NSArray *response, NSError *error) {
        
        //if there are no unseen tweets then return
        if([response[0] intValue] == 0) {
            completionHandler(UIBackgroundFetchResultNewData);
            return;
        }
        
        //Schedule notifications for new tweets
        NSArray *arrStatuses = response[1];
        for (Statuses *objStatus in arrStatuses) {
            [self setNotificationForStatus:objStatus];
        }
        completionHandler(UIBackgroundFetchResultNewData);
    }];
   
}

#pragma mark - Method to set local notification

///Method to set local notifications
- (void)setNotificationForStatus:(Statuses*)objStatus {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    notification.alertBody = [NSString stringWithFormat:@"%@: %@", objStatus.user.name, objStatus.text];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
