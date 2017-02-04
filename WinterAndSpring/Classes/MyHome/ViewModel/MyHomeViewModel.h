//
//  MyHomeViewModel.h
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ReturnValueBlock) (id returnValue);

@interface MyHomeViewModel : NSObject
@property (nonatomic,strong) NSMutableArray *listArray;
@property (strong, nonatomic) ReturnValueBlock returnBlock;
-(void)readMyData;
-(void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock;
@end
