//
//  JHTabbar.m
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "JHTabbar.h"
@interface JHTabbar()
/** 记录上一次被点击按钮的tag*/

@end

@implementation JHTabbar
@synthesize delegate;

-(void)layoutSubviews{
    
    [super layoutSubviews];
    //初始化数据缓存
    
    //设置tabbar背景颜色
    UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self insertSubview:bgView atIndex:1];
    self.opaque = YES;
    //    [self setClipsToBounds:YES];//去除tabbar顶部线条
    NSInteger count = self.items.count;
    
    //调整内部子控件位置
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / count;
    CGFloat btnH = self.frame.size.height;
    
    NSInteger i = 0;
    
    
    for (UIControl *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            btnX = i * btnW;
            
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            tabBarButton.tag = i;
            
            i++;
            
            //监听tabBar点击
            [tabBarButton addTarget:self action:@selector(tabbarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    }
    
}

#pragma mark - 监听按钮点击
-(void)tabbarButtonClick:(UIControl *)tabBarButton{
    if ([self.myDelegate respondsToSelector:@selector(jhTabBarDidClickButton:)]) {
        
        [self.myDelegate jhTabBarDidClickButton:tabBarButton];
    
    }
}

 /*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
