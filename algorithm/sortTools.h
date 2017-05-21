//
//  sortTools.h
//  algorithmPrac
//
//  Created by Joseph on 2017/5/21.
//  Copyright © 2017年 dosomethingq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sortTools : NSObject

typedef enum {
    SortTypeInsertSort = 0,
    SortTypeSeletionSort,
    SortTypeHeapSort
}sortType;

+(BOOL)arrayIsSorted:(NSArray*)datas;
+(void)timeConsume:(NSDate*)start name:(NSString*)callerMethod;


@end
