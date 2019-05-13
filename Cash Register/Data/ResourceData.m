//
//  ResourceData.m
//  Cash Register
//
//  Created by Arthur Cheung on 2018-10-19.
//  Copyright © 2018 Arthur Cheung. All rights reserved.
//

#import "ResourceData.h"

@implementation ResourceData
-(NSMutableArray*)priceArray{
    if (_priceArray == nil)
        _priceArray = [[NSMutableArray alloc]initWithObjects:@"10.99",@"20.99",@"30.99",@"40.99",@"5.99", nil];
    return _priceArray;
    
}


-(NSMutableArray*)nameArray{
    if (_nameArray == nil)
        _nameArray = [[NSMutableArray alloc]initWithObjects:@"shoes",@"pants",@"shirt",@"watch",@"tie", nil];
    return _nameArray;
    
}

-(NSMutableArray*)countArray{
    if (_countArray == nil)
        _countArray = [[NSMutableArray alloc]initWithObjects:@"10",@"10",@"10",@"10",@"10", nil];
    return _countArray;
    
}
@end
