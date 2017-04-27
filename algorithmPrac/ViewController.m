//
//  ViewController.m
//  algorithmPrac
//
//  Created by Joseph on 2017/3/26.
//  Copyright © 2017年 dosomethingq. All rights reserved.
//

#import "ViewController.h"
#import "algorithmPrac-swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *testArray=@[@6,@5,@4,@3,@2,@1];
    NSArray *insertSortResult=[self insertSort:testArray];
    NSArray *selectionSortResult=[self selectionSort:testArray];
    NSArray *swiftSelectionSortResult=[[algorithm shareInstance] selectionSort:testArray];

    NSLog(@"result %@,%@,%@",insertSortResult,selectionSortResult,swiftSelectionSortResult);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)timeConsume:(NSDate*)start name:(NSString*)callerMethod{
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:start];
    NSLog(@"%@ executionTime = %f",callerMethod,executionTime);
}

#pragma mark - Sort

// O(n^2) , 2 loop , for small amounts of data, insertion sort is actually faster, especially if the array is partially sorted already
-(NSArray*)insertSort:(NSArray*)dataArray{
    
    NSDate *methodStart = [NSDate date];
    
    NSMutableArray *sortedArray=[[NSMutableArray alloc]initWithArray:dataArray];
    NSArray *resultArray=sortedArray;
    
    if (!(resultArray.count >1)) {
        return resultArray;
    }
    
    for (int i=1; i<sortedArray.count ; i++) {
        
        int sortedIndex=i;
        while (sortedIndex>0 && [sortedArray[sortedIndex]integerValue] < [sortedArray[sortedIndex-1] integerValue] ) {
            // swap them
            [sortedArray exchangeObjectAtIndex:sortedIndex withObjectAtIndex:sortedIndex-1];
            sortedIndex--;
        }
    }
    
    [self timeConsume:methodStart name:NSStringFromSelector(_cmd)];
    return resultArray;
}

// O(n^2) , 2 loop , It is worse than insertion sort but better than bubble sort. Finding the lowest element in the rest of the array is slow, especially since the inner loop will be performed repeatedly .
-(NSArray*)selectionSort:(NSArray*)dataArray{
    
    NSDate *methodStart = [NSDate date];
    
    NSMutableArray *sortArray=[[NSMutableArray alloc]initWithArray:dataArray];
    NSArray *resultArray=sortArray;

    if (!(resultArray.count >1)) {
        return resultArray;
    }
    
    for (int x=0; x<sortArray.count; x++) {
        
        int lowest = [sortArray[x]intValue];
        for (int y=x+1; y<sortArray.count; y++) {
            
            if ([sortArray[y]intValue] < lowest) {
                // swap them
                [sortArray exchangeObjectAtIndex:y withObjectAtIndex:x];
            }
        }
    }
    [self timeConsume:methodStart name:NSStringFromSelector(_cmd)];
    return resultArray;
}


@end
