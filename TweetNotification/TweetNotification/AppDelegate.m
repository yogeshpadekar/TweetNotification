//
//  AppDelegate.m
//  TweetNotification
//
//  Created by Yogesh on 03/11/16.
//  Copyright © 2016 Riddhesh. All rights reserved.
//

#import "AppDelegate.h"
#import <DataAccess/DataAccess.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:
                                                   UIUserNotificationTypeAlert|
                                                   UIUserNotificationTypeSound categories:nil]];
    [application registerForRemoteNotifications];

    [application setMinimumBackgroundFetchInterval:5];
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
    
    [DataAccess loadHashtagQueryForHashTag:self.strHashtag withCallback:^(NSArray *response, NSError *error) {
        
        //if there are no unseen tweets then return
        if([response[0] intValue] == 0)
            return;
        
        //Schedule notifications for new tweets
        NSArray *arrStatuses = response[1];
        for (Statuses *objStatus in arrStatuses) {
            [self setNotificationForStatus:objStatus];
        }
    }];
   
}

#pragma mark - Method to set local notification
- (void)setNotificationForStatus:(Statuses*)objStatus {
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:3];
    notification.alertBody = [NSString stringWithFormat:@"%@: %@", objStatus.user.name, objStatus.text];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
