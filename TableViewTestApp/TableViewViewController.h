//
//  TableViewViewController.h
//  TableViewTestApp
//
//  Created by Dmitriy Starodubtsev on 25.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataController.h"

@class DataController;

@interface TableViewViewController : UITableViewController {
    DataController *dataController;
    UIView *myView;
}

@property (nonatomic, retain) DataController *dataController;
@property (nonatomic, retain) UIView *myView;

@end
