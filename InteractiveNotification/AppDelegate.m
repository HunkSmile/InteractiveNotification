//
//  AppDelegate.m
//  InteractiveNotification
//
//  Created by Hunk on 14/10/24.
//  Copyright (c) 2014年 Hunk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Register remote notifications
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    // Cancel action
    UIMutableUserNotificationAction *cancelAction = [[UIMutableUserNotificationAction alloc] init];
    [cancelAction setIdentifier:@"CancelNotificationActionIdentifier"];
    [cancelAction setTitle:@"Cancel"];
    [cancelAction setActivationMode:UIUserNotificationActivationModeBackground];
    [cancelAction setAuthenticationRequired:NO];
    [cancelAction setDestructive:NO];
    
    // Accept action
    UIMutableUserNotificationAction *acceptAction = [[UIMutableUserNotificationAction alloc] init];
    [acceptAction setActivationMode:UIUserNotificationActivationModeBackground];
    [acceptAction setTitle:@"Accept"];
    [acceptAction setIdentifier:@"AcceptNotificationActionIdentifier"];
    [acceptAction setDestructive:YES];
    [acceptAction setAuthenticationRequired:NO];
    
    // Notification category
    UIMutableUserNotificationCategory *notificationCategory = [[UIMutableUserNotificationCategory alloc] init];
    [notificationCategory setIdentifier:@"NotificationCategoryIdentifier"];
    [notificationCategory setActions:@[acceptAction, cancelAction]
                          forContext:UIUserNotificationActionContextDefault];
    
    // Notification settings
    UIUserNotificationType notificationTypes = (UIUserNotificationTypeAlert|
                                                UIUserNotificationTypeSound|
                                                UIUserNotificationTypeBadge);
    NSSet *categoriesSet = [NSSet setWithObject:notificationCategory];
    
    UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:notificationTypes
                                                                                         categories:categoriesSet];
    // Register user notification
    [[UIApplication sharedApplication] registerUserNotificationSettings:notificationSettings];
    
    return YES;
}

-(void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler
{
    
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler
{
    if([identifier isEqualToString:@"CancelNotificationActionIdentifier"])
    {
        NSLog(@"You chose cancel action.");
    }
    else if ([identifier isEqualToString:@"AcceptNotificationActionIdentifier"])
    {
        NSLog(@"You chose accept action.");
    }
    
    completionHandler();
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

@end
