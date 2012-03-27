//
//  DataController.m
//  TableViewTestApp
//
//  Created by Dmitriy Starodubtsev on 25.03.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataController.h"

@implementation DataController

@synthesize list;

- (id)init {
    if (self = [super init]){
        NSMutableArray *localList = [[NSMutableArray alloc] init]; //Instantiate list
        self.list = localList;
        [localList release];
    }
    return self;
}

- (unsigned)countOfList {
    return [list count];
}

- (id)objectInListAtIndex:(unsigned)theIndex {
    return [list objectAtIndex:theIndex];
}

- (void)removeDataAtIndex:(unsigned)theIndex {
    [list removeObjectAtIndex:theIndex];
}

- (void)addData:(NSString*)data {
    [list addObject:data];
}

- (void)setList:(NSMutableArray *)newList {
    if (list != newList) {
        [list release];
        list = [newList mutableCopy];
    }
}

- (void)dealloc {
    [list release];
    [super dealloc];
}

@end
