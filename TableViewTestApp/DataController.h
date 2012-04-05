//
//  DataController.h
//  TableViewTestApp
//
//  Created by Dmitriy Starodubtsev on 25.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataController : NSObject {
    NSMutableArray *list;
}

- (unsigned)countOfList; // Returns number of elements in list    
- (id)objectInListAtIndex:(unsigned)theIndex; // Returns object at given index
- (void)addData:(NSString *)data; // Adds data to the list 
- (void)removeDataAtIndex:(unsigned)theIndex; // Remove data from the list

@property (nonatomic, copy, readwrite) NSMutableArray *list;

@end
