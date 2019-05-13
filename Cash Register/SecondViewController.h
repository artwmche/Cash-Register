//
//  SecondViewController.h
//  Cash Register
//
//  Created by Arthur Cheung on 2018-10-19.
//  Copyright © 2018 Arthur Cheung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResourceData.h"

NS_ASSUME_NONNULL_BEGIN

@protocol sendResourceProtocolAgain <NSObject>

-(void)sendResourceToCR:(ResourceData*)rData;

@end

@interface SecondViewController : UIViewController
@property (strong,nonatomic)ResourceData* rData;
@property (strong,nonatomic)NSMutableArray* historyArray;
@property (nonatomic)id<sendResourceProtocolAgain> delegate;
@end

NS_ASSUME_NONNULL_END
