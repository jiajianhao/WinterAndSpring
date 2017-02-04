//
//  JHTabbarController.m
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "JHTabbarController.h"
 #define TABBAR_NORMAL_COLOR JHColor(146, 146, 146)
#define TABBAR_SELECTED_COLOR JHColor(255, 80, 0)
#import "JHTabbar.h"
#import "SingleViewController.h"
#import "MyHomeViewController.h"
#import "BusinessViewController.h"
@interface JHTabbarController ()<UITabBarDelegate,JHTabBarDelegate>

@end

@implementation JHTabbarController


//只会调用一次,类加载的时候就调用
+(void)load{
    
        UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
        
        NSMutableDictionary *attrSel = [NSMutableDictionary dictionary];
        attrSel[NSForegroundColorAttributeName] = TABBAR_SELECTED_COLOR;
        [item setTitleTextAttributes:attrSel forState:UIControlStateSelected];
        
        NSMutableDictionary *attrNor = [NSMutableDictionary dictionary];
        attrNor[NSFontAttributeName] = [UIFont systemFontOfSize:11];
        attrNor[NSForegroundColorAttributeName] = TABBAR_NORMAL_COLOR;
        [item setTitleTextAttributes:attrNor forState:UIControlStateNormal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChildViewController];
    
    [self setUpTabBarButton];
    
    JHTabbar *jhTabbar =[[JHTabbar alloc]init];
    [self setValue:jhTabbar forKeyPath:@"tabBar"];
    jhTabbar.delegate=self;
    jhTabbar.myDelegate=self;
    jhTabbar.translucent=NO;
    
}

- (void)setUpTabBarButton{
    //商务
    UINavigationController *nav1 = self.childViewControllers[0];
    nav1.tabBarItem.title = @"Busi";
    nav1.tabBarItem.image =[self scaleImageToSize: [UIImage imageNamed:@"busi_01"] size:CGSizeMake(28, 28)] ;
    nav1.tabBarItem.selectedImage =[self scaleImageToSize: [UIImage imageNamed:@"busi_02"] size:CGSizeMake(28, 28)];
   //首页
    UINavigationController *nav2 = self.childViewControllers[1];
    nav2.tabBarItem.title = @"Home";
    nav2.tabBarItem.image =[self scaleImageToSize: [UIImage imageNamed:@"home_01"] size:CGSizeMake(28, 28)] ;
    nav2.tabBarItem.selectedImage =[self scaleImageToSize: [UIImage imageNamed:@"home_02"] size:CGSizeMake(28, 28)];
    //个人
    UINavigationController *nav3 = self.childViewControllers[2];
    nav3.tabBarItem.title = @"Single";
    nav3.tabBarItem.image = [self scaleImageToSize: [UIImage imageNamed:@"single_01"] size:CGSizeMake(28, 28)];
    nav3.tabBarItem.selectedImage = [self scaleImageToSize: [UIImage imageNamed:@"single_02"] size:CGSizeMake(28, 28)];
    

}

- (void)setUpChildViewController{
    
    //商务

    BusinessViewController *busiVc = [[BusinessViewController alloc] init];
    [self addChildViewController:busiVc];
    //首页
    MyHomeViewController *homeVC = [[MyHomeViewController alloc] init];
    [self addChildViewController:homeVC];
    //个人
    SingleViewController *singleVC = [[SingleViewController alloc] init];
    [self addChildViewController:singleVC];
    
    
}

- (void)addChildViewController:(UIViewController *)childController{
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childController];
    [super addChildViewController:nav];
    
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    return YES;
}
-(UIImage *)scaleImageToSize:(UIImage *)img size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [scaledImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

#pragma mark jhtabbar
-(void)jhTabBarDidClickButton:(UIControl *)tabButton{
    NSLog(@"%d",(int)tabButton.tag);
    NSLog(@"*************************");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
