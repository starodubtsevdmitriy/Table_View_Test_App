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


- (unsigned)countOfList; //returns number of elements in list    
- (id)objectInListAtIndex:(unsigned)theIndex; //returns object at given index
- (void)addData:(NSString*)data; //adds data to the list 
- (void)removeDataAtIndex:(unsigned)theIndex;

@property (nonatomic, copy, readwrite) NSMutableArray *list;

@end
