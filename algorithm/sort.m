//
//  sort.m
//  algorithmPrac
//
//  Created by Joseph on 2017/5/21.
//  Copyright © 2017年 dosomethingq. All rights reserved.
//

#import "sort.h"
#import "sortTools.h"

@implementation sort

// O(n^2) , 2 loop , for small amounts of data, insertion sort is actually faster, especially if the array is partially sorted already
+(NSArray*)algorithmInsertSort:(NSArray*)dataArray{
    
    NSDate *methodStart = [NSDate date];
    
    NSMutableArray *sortedArray=[[NSMutableArray alloc]initWithArray:dataArray];
    NSArray *resultArray=sortedArray;
    
    if (!(resultArray.count >1)) {
        return resultArray;
    }
    
    for (NSInteger i=1; i<sortedArray.count ; i++) {
        
        NSInteger sortedIndex=i;
        while (sortedIndex>0 && [sortedArray[sortedIndex]integerValue] < [sortedArray[sortedIndex-1] integerValue] ) {
            // swap them
            [sortedArray exchangeObjectAtIndex:sortedIndex withObjectAtIndex:sortedIndex-1];
            sortedIndex--;
        }
    }
    
    assert([sortTools arrayIsSorted:resultArray]);
    [sortTools timeConsume:methodStart name:NSStringFromSelector(_cmd)];
    return resultArray;
}


// O(n^2) , 2 loop , It is worse than insertion sort but better than bubble sort. Finding the lowest element in the rest of the array is slow, especially since the inner loop will be performed repeatedly .
+(NSArray*)algorithmSelectionSort:(NSArray*)dataArray{
    
    NSDate *methodStart = [NSDate date];
    
    NSMutableArray *sortArray=[[NSMutableArray alloc]initWithArray:dataArray];
    NSArray *resultArray=sortArray;
    
    if (!(resultArray.count >1)) {
        return resultArray;
    }
    
    for (NSInteger x=0; x<sortArray.count; x++) {
        
        NSInteger lowest = [sortArray[x]integerValue];
        for (NSInteger y=x+1; y<sortArray.count; y++) {
            
            if ([sortArray[y]integerValue] < lowest) {
                // swap them
                [sortArray exchangeObjectAtIndex:y withObjectAtIndex:x];
            }
        }
    }
    
    assert(![sortTools arrayIsSorted:resultArray]);
    [sortTools timeConsume:methodStart name:NSStringFromSelector(_cmd)];
    return resultArray;
#warning to do , above result had a little issue
}


// O(n log (n))
+(NSArray*)algorithmHeapSort:(NSArray*)dataArray{
    
    NSDate *methodStart = [NSDate date];
    
    NSMutableArray *sortArray=[[NSMutableArray alloc]initWithArray:dataArray];
    NSArray *resultArray=sortArray;
    
    // Sort max heap in the node
    NSInteger j = (sortArray.count/2)-1;
    while (j>=0) {
        [self maxHeapInTheNote:sortArray root:j count:sortArray.count];
        j--;
    }
    
    NSInteger k = sortArray.count-1;
    while (k>0) {
        // swap top with bottom
        [sortArray exchangeObjectAtIndex:0 withObjectAtIndex:k];
        
        // max heap again beacause swap top and bottom
        [self maxHeapInTheNote:sortArray root:0 count:k];
        
        k--;
    }
    
    assert([sortTools arrayIsSorted:resultArray]);
    [sortTools timeConsume:methodStart name:NSStringFromSelector(_cmd)];
    return sortArray;
}

+(void)maxHeapInTheNote:(NSMutableArray*)datas root:(NSInteger)rootNode count:(NSInteger)length{
    
    NSInteger leftChild = rootNode*2+1;
    NSInteger rightChild = rootNode*2+2;
    NSInteger maxNode = -1;
    
    // find the largest in left,right,root node
    if(leftChild < length && [datas[leftChild]integerValue] > [datas[rootNode]integerValue]){
        maxNode = leftChild;
    }else{
        maxNode = rootNode;
    }
    
    if(rightChild < length && [datas[rightChild]integerValue] > [datas[maxNode]integerValue]){
        maxNode = rightChild;
    }
    
    if(maxNode != rootNode){
        [datas exchangeObjectAtIndex:rootNode withObjectAtIndex:maxNode];
        [self maxHeapInTheNote:datas root:maxNode count:length];
    }
    
}

@end
