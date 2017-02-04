//
//  JHRequest.h
//  WinterAndSpring
//
//  Created by admin on 2017/1/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessBlock) (id returnValue);
typedef void (^FailureBlock) (id errorCode);
@interface JHRequest : NSObject
+(void)networkingPostMethod:(NSDictionary *)parameters urlName:(NSString *)urlName success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;
+(void)networkingGetMethod:(NSDictionary *)parameters urlName:(NSString *)urlName success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock;
@end
