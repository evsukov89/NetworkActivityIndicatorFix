//
//  AppDelegate.m
//  NetworkActivityIndicatorFix
//
//  Created by Igor Evsukov on 5/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    [self.window makeKeyAndVisible];
    
	[self performSelector:@selector(startNetworkTask1) withObject:nil afterDelay:0];
	
	[self performSelector:@selector(startNetworkTask2) withObject:nil afterDelay:0.5];
	
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. 
	 This can occur for certain types of temporary interruptions (such as 
	 an incoming phone call or SMS message) or when the user quits the 
	 application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle 
	 down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, 
	 and store enough application state information to restore your application 
	 to its current state in case it is terminated later. 
     If your application supports background execution, called instead 
	 of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: 
	 here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application 
	 was inactive. If the application was previously in the background, optionally 
	 refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that 
	 can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


#pragma mark -
#pragma mark network tasks
- (void)startNetworkTask1 {
	[self performSelectorInBackground:@selector(networkTask1) withObject:nil];
}

- (void)networkTask1 {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	//[[UIApplication sharedApplication] showNetworkActivityIndicator];
	
	[NSThread sleepForTimeInterval:3];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	//[[UIApplication sharedApplication] hideNetworkActivityIndicator];
	
	[pool drain];
}

- (void)startNetworkTask2 {
	[self performSelectorInBackground:@selector(networkTask2) withObject:nil];
}

- (void)networkTask2 {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	//[[UIApplication sharedApplication] showNetworkActivityIndicator];
	
	[NSThread sleepForTimeInterval:5];
	
	Log(@"networkActivityIndicatorVisible=%d",[UIApplication sharedApplication].networkActivityIndicatorVisible);
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	//[[UIApplication sharedApplication] hideNetworkActivityIndicator];
	
	[pool drain];	
}



@end
