//
//  SingleView.h
//  WinterAndSpring
//
//  Created by admin on 2017/1/10.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SingleViewBlock)(NSInteger x) ;

@interface SingleView : UIView

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *telLabel;
@property (nonatomic,strong) UIButton *helloBtn;
@property (nonatomic,strong) UIButton *arc4RandomBtn;
@property (nonatomic,strong) UILabel *titleLabel;

//block属性
@property (nonatomic, copy) SingleViewBlock buttonBlock;
//block方法
-(void)handlerButtonAction:(SingleViewBlock)block;

 
@end
