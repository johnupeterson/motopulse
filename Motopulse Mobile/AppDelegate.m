//
//  AppDelegate.m
//  Motopulse Mobile
//
//  Created by Cher Chronis on 10/12/16.
//  Copyright © 2016 Darkhorse Technology. All rights reserved.
//

#import "AppDelegate.h"
#import "globals.h"
NSString *ccid;
NSString *moto_alarm;
NSString *biker_number;
NSString *crash_number;
NSString *security_code;
NSString *motopulse_number;
NSString *motion_sensitivity;
NSString *ride_tracking;
NSString *voice_crash_setting;
NSString *voice_motion_setting;


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    sleep(3);
    

    ccid = [[NSUserDefaults standardUserDefaults]
            stringForKey:@"ccid"];
    
    moto_alarm = [[NSUserDefaults standardUserDefaults]
                  stringForKey:@"moto_alarm"];
    biker_number = [[NSUserDefaults standardUserDefaults]
                    stringForKey:@"biker_number"];
    crash_number = [[NSUserDefaults standardUserDefaults]
                    stringForKey:@"crash_number"];
    security_code = [[NSUserDefaults standardUserDefaults]
                     stringForKey:@"security_code"];
    motopulse_number = [[NSUserDefaults standardUserDefaults]
                     stringForKey:@"motopulse_number"];
    motion_sensitivity = [[NSUserDefaults standardUserDefaults]
                        stringForKey:@"motion_sensitivity"];
    ride_tracking = [[NSUserDefaults standardUserDefaults]
                          stringForKey:@"ride_tracking"];
    voice_crash_setting = [[NSUserDefaults standardUserDefaults]
                     stringForKey:@"voice_crash_setting"];
    voice_motion_setting = [[NSUserDefaults standardUserDefaults]
                           stringForKey:@"voice_motion_setting"];
    
    NSLog(@"CCID: %@",ccid);
    NSLog(@"Alarm: %@",moto_alarm);
    NSLog(@"Biker Number: %@",biker_number);
    NSLog(@"Crash Number: %@",crash_number);
    NSLog(@"Security Code: %@",security_code);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
