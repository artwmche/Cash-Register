//
//  ResourceData.h
//  Cash Register
//
//  Created by Arthur Cheung on 2018-10-19.
//  Copyright © 2018 Arthur Cheung. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResourceData : NSObject
@property (nonatomic, strong)NSMutableArray* priceArray;
@property (nonatomic, strong)NSMutableArray* nameArray;
@property (nonatomic, strong)NSMutableArray* countArray;
@end

NS_ASSUME_NONNULL_END
