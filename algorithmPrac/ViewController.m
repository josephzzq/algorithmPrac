//
//  ViewController.m
//  algorithmPrac
//
//  Created by Joseph on 2017/3/26.
//  Copyright © 2017年 dosomethingq. All rights reserved.
//

#import "ViewController.h"
#import "algorithmPrac-swift.h"

#define MAX_COUNT 10000

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSMutableArray *testArray = [[NSMutableArray alloc]initWithCapacity:MAX_COUNT];
    
    for (int i=0; i<MAX_COUNT; i++) {
        
        NSNumber *randomNum = [NSNumber numberWithInt:arc4random() % MAX_COUNT +1];
        [testArray addObject:randomNum];
    }

    NSArray *swiftSelectionSortResult=[[algorithm shareInstance] selectionSort:testArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
