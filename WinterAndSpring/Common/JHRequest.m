//
//  JHRequest.m
//  WinterAndSpring
//
//  Created by admin on 2017/1/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "JHRequest.h"

@implementation JHRequest


+(void)networkingPostMethod:(NSDictionary *)parameters urlName:(NSString *)urlName success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager=[AFHTTPSessionManager   manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager POST:urlName parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
}

+(void)networkingGetMethod:(NSDictionary *)parameters urlName:(NSString *)urlName success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [manager GET:urlName parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"responseObject : %@",responseObject);
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"error : %@",error);

        failureBlock(error);
    }];
    
}
@end
