//
//  JHTabbar.h
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JHTabBarDelegate <NSObject>
@optional
- (void)jhTabBarDidClickButton:(UIControl *)tabButton;

@end


@interface JHTabbar : UITabBar

@property (nonatomic, weak) id<JHTabBarDelegate> myDelegate;


@end


