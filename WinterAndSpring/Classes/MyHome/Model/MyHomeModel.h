//
//  MyHomeModel.h
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyHomeModel : NSObject
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *small;
@end

@interface MyHomeModel_Image : NSObject
@property(nonatomic,strong)NSString *large;
@property(nonatomic,strong)NSString *medium;
@property(nonatomic,strong)NSString *small;
@end

@interface MyHomeModel_Tags : NSObject
@property(nonatomic,strong)NSString *count;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *title;
@end

@interface MyHomeModel_Cell : NSObject
@property(nonatomic,strong)NSString *image;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *title;
@end
