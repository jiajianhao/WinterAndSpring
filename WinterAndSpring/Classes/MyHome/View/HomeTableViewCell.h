//
//  HomeTableViewCell.h
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyHomeModel_Cell;

typedef void (^InvestBlock)(NSInteger m) ;

@interface HomeTableViewCell : UITableViewCell
@property(nonatomic,weak)MyHomeModel_Cell *myModel_cell;

/** tag*/
@property (nonatomic,assign) int index;

//block属性
@property (nonatomic, copy) InvestBlock buttonBlock;
//block方法
-(void)handlerInvestButtonAction:(InvestBlock)block;

@end
