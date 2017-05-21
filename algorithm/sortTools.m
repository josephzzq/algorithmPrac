//
//  sortTools.m
//  algorithmPrac
//
//  Created by Joseph on 2017/5/21.
//  Copyright © 2017年 dosomethingq. All rights reserved.
//

#import "sortTools.h"

@implementation sortTools

+(BOOL)arrayIsSorted:(NSArray*)datas{
    
    for (NSInteger i=0; i<datas.count-1; i++) {
        
        NSInteger a = [[datas objectAtIndex:i]integerValue];
        NSInteger b = [[datas objectAtIndex:i+1]integerValue];
        
        if (a>b) {
            return NO;
        }
        
    }
    return YES;
}


+(void)timeConsume:(NSDate*)start name:(NSString*)callerMethod{
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:start];
    NSLog(@"%@ --- executionTime --- %f",callerMethod,executionTime);
}

@end
