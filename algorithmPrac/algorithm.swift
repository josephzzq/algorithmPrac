//
//  algorithm.swift
//  algorithmPrac
//
//  Created by Joseph.Tsai on 2017/4/27.
//  Copyright © 2017年 dosomethingq. All rights reserved.
//

import Foundation

class algorithm : NSObject {
    
    static let shareInstance = algorithm()
    
    
    
    
    
    
    
    
    
    //MARK: - Selection Sort
    func selectionSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else { return array }
        
        var a = array
        for x in 0 ..< a.count {
            
            var lowest = x
            for y in x + 1 ..< a.count {
                if a[y] < a[lowest] {
                    lowest = y
                }
            }
            
            if x != lowest {              
                swap(&a[x], &a[lowest])
            }
        }
        return a
    }
    
}
