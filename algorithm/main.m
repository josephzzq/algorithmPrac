//
//  main.m
//  algorithm
//
//  Created by Joseph on 2017/5/21.
//  Copyright © 2017年 dosomethingq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sort.h"
#import "sortTools.h"

#define MAX_COUNT 10000

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *sortAlgorithms = [NSArray arrayWithObjects:@(SortTypeInsertSort),
                                   @(SortTypeSeletionSort),
                                   @(SortTypeHeapSort),
                                   nil];
        
        NSMutableArray *unsortArray = [[NSMutableArray alloc]initWithCapacity:MAX_COUNT];
        
        for (NSInteger i=0; i<MAX_COUNT; i++) {
            NSNumber *randomNum = [NSNumber numberWithInt:arc4random() % MAX_COUNT +1];
            [unsortArray addObject:randomNum];
        }
        
        for (NSNumber *sortNum in sortAlgorithms) {
            NSInteger sortType = sortNum.integerValue;
            
            switch (sortType) {
                case SortTypeInsertSort:
                    [sort algorithmInsertSort:unsortArray];
                    break;
                    
                case SortTypeSeletionSort:
                    [sort algorithmSelectionSort:unsortArray];
                    break;
                    
                case SortTypeHeapSort:
                    [sort algorithmHeapSort:unsortArray];
                    break;
            }
            
        }
        
    }
    return 0;
}
