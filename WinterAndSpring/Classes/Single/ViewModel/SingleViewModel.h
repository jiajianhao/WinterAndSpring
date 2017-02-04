//
//  SingleViewModel.h
//  WinterAndSpring
//
//  Created by admin on 2017/1/11.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ReturnValueBlock) (id returnValue);

@interface SingleViewModel : NSObject
@property (strong, nonatomic) ReturnValueBlock returnBlock;
-(void)readMyData;
-(void)setBlockWithReturnBlock: (ReturnValueBlock) returnBlock;

@end
