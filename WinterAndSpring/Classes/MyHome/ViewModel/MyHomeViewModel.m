//
//  MyHomeViewModel.m
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MyHomeViewModel.h"
#import "JHRequest.h"
@implementation MyHomeViewModel
-(instancetype)init{
    self = [super init];
    if (self) {
        self.listArray =[[NSMutableArray alloc]init];
    }
    return self;
}



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
