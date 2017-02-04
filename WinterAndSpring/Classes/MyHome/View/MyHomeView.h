//
//  MyHomeView.h
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyHomeViewModel;
@class MyHomeModel;
typedef void (^HomeViewBlock)(NSInteger x) ;

@interface MyHomeView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MyHomeViewModel *viewModel;
@property (nonatomic,strong) MyHomeModel *model;



//block属性
@property (nonatomic, copy) HomeViewBlock buttonBlock;
//block方法
-(void)handlerButtonAction:(HomeViewBlock)block;

@end
