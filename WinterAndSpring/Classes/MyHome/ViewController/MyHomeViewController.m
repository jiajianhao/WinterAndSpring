//
//  MyHomeViewController.m
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MyHomeViewController.h"
#import "MyHomeView.h"
#import "HomeDetailViewController.h"
@interface MyHomeViewController ()
@property (nonatomic,strong)MyHomeView *myHomeView;
@end

@implementation MyHomeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar showBadgeOnItemIndex:0];
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.tabBarController.tabBar hideBadgeOnItemIndex:0];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent=NO;
    // Do any additional setup after loading the view.
    [self myHomeView];
    [self selectAlgorithm];
    [self bubbleUpAlgorithm];
}
-(MyHomeView*)myHomeView{
    if (_myHomeView==nil) {
        __weak typeof(self) weakSelf = self;
        _myHomeView = [[MyHomeView alloc]initWithFrame:CGRectMake(0, 0, mWidth, mHeight)];
        [_myHomeView handlerButtonAction:^(NSInteger m){
            [weakSelf gotoDetailView];
        }];
        [self.view addSubview:_myHomeView];
    }
    return _myHomeView;
}

-(void)selectAlgorithm{
    NSMutableArray * array = [NSMutableArray arrayWithObjects: @"1",@"8",@"2",@"7",@"2",@"5",@"9",nil];
    
    //选择
    
    for (int  i =0; i<[array count]-1; i++) {
        
        for (int j = i+1; j<[array count]; j++) {
            
            if ([array[i] intValue]>[array[j] intValue]) {
                
                //交换
                
                [array exchangeObjectAtIndex:i withObjectAtIndex:j];
                
            }
            
        }
        
    }
    
    NSLog(@"%@",array);
}

-(void)bubbleUpAlgorithm{
    NSMutableArray * array1 =[[NSMutableArray alloc]initWithObjects:@"zhige",@"saozi",@"bge",@"xiaolong",@"xiaomo",@"xiaomi", nil];
    
    //冒泡
    
    for (int i =0; i<[array1 count]-1; i++) {
        
        for (int j =0; j<[array1 count]-1-i; j++) {
            
            if(([array1[j] compare:array1[j+1]]) == NSOrderedDescending){
                
                //交换
                
                [array1 exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                
                
                
            }
            
        }
        
    }
    
    
    
    NSLog(@"%@",array1);
}

-(void)gotoDetailView{
    HomeDetailViewController *detal1view = [[HomeDetailViewController alloc]init];
    detal1view.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:detal1view animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
