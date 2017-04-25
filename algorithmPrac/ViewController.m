//
//  ViewController.m
//  algorithmPrac
//
//  Created by Joseph on 2017/3/26.
//  Copyright © 2017年 dosomethingq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *testArray=@[@6,@5,@4,@3,@2,@1];
    NSArray *result=[self forInsertSort:testArray];
    NSLog(@"result %@",result);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSArray*)forInsertSort:(NSArray*)dataArray{
    NSMutableArray *sortedArray=[[NSMutableArray alloc]initWithArray:dataArray];
    NSArray *resultArray=sortedArray;
    
    for (int i=1; i<sortedArray.count ; i++) {
        int sortedIndex=i;
        while (sortedIndex>0 && [sortedArray[sortedIndex]integerValue] < [sortedArray[sortedIndex-1] integerValue] ) {
            // swap them
            [sortedArray exchangeObjectAtIndex:sortedIndex withObjectAtIndex:sortedIndex-1];
            sortedIndex--;
            NSLog(@"sorted %@",sortedArray);
        }
    }
    return resultArray;
}


@end
