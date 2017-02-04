//
//  SingleViewModel.m
//  WinterAndSpring
//
//  Created by admin on 2017/1/11.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "SingleViewModel.h"
#import "JHRequest.h"
@implementation SingleViewModel

-(void)readMyData{
    [JHRequest networkingGetMethod:nil urlName:@"https://api.douban.com/v2/book/1220559" success:^(id rValue){
        _returnBlock(rValue);
     }failure:^(id error){
        _returnBlock(error);

    }];
    
    
}
 -(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock
{
    _returnBlock = returnBlock;
 }


@end
