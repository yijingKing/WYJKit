//
//  AppDelegate.h
//  WYJKitDemo
//
//  Created by PZ-IMAC-1 on 2021/11/2.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer API_AVAILABLE(ios(10.0));

- (void)saveContext;


@end

