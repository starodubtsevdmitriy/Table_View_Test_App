//
//  TableViewAppDelegate.h
//  TableViewTestApp
//
//  Created by Dmitriy Starodubtsev on 25.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableViewViewController;

@interface TableViewAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TableViewViewController *viewController;

@end
