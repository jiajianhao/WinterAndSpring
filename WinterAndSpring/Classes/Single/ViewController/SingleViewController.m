//
//  SingleViewController.m
//  WinterAndSpring
//
//  Created by admin on 2017/1/10.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "SingleViewController.h"
#import "SingleView.h"
#import "SingleModel.h"
#import "SingleViewModel.h"
#import <React/RCTRootView.h>

@interface SingleViewController ()
@property (nonatomic,strong)SingleView *singleview;
@property (nonatomic,strong)SingleModel *singlemodel;

@end

@implementation SingleViewController

- (void)viewDidLoad {
   [super viewDidLoad];
    self.navigationController.navigationBar.translucent=NO;

    // Do any additional setup after loading the view.
    [self singleview];
//    [self testBlock];
    [self showRandomValue];
    [self getMyData];
    
}


-(SingleView *)singleview{
    
    if (_singleview == nil) {
        _singleview = [[SingleView alloc] initWithFrame:CGRectMake(0, 0, mWidth, mHeight)];
        [_singleview handlerButtonAction:^(NSInteger tag){
            
            switch (tag) {
                case 0:
                    [self testBlock];

                    break;
                case 1:
                    [self showRandomValue];
                    
                    break;

                default:
                    break;
            }
            
        }];
        [self.view addSubview:_singleview];
    }
    return _singleview;
}

#pragma mark 页面刷新
-(void)refreshMyView{
    _singleview.titleLabel.text=_singlemodel.title;
}
#pragma mark 获取数据
-(void)getMyData{
    SingleViewModel *viewModel1 = [[SingleViewModel alloc]init];
    __weak typeof(self) weakSelf = self;
    
    [viewModel1 setBlockWithReturnBlock:^(id returnvalue){
        NSLog(@"returnvalue:%@",returnvalue);
        //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:returnvalue options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"%@",dic);
        //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:returnvalue options:NSJSONReadingMutableContainers error:nil];
        if ([returnvalue isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:returnvalue];
            
            weakSelf.singlemodel = [SingleModel yy_modelWithJSON:dic];
            NSLog(@"title : %@",weakSelf.singlemodel.title);
            NSMutableArray *arr =dic[@"images"];
            NSLog(@"images : %@",arr);
            //            for (NSDictionary *dic1 in arr) {
            //                SingleModel *model1 = [SingleModel yy_modelWithJSON:dic1];
            //                NSLog(@"%@",model1.text);
            //
            //            }
            
            [weakSelf refreshMyView];
//            [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(refreshMyView) userInfo:nil repeats:NO];//设置执行时间

            
            
        }
        
        
        
        
        
    }];
    [viewModel1 readMyData];
    

}
#pragma mark test
-(void)testBlock{
//    int b = 0;
//    void (^blo)() = ^{
//        NSLog(@"Input:b=%d",b);
//    };
//    b = 3;
//    blo();//输出Input:b=0
    
    
//    int b = 0;
//    void (^blo)() = ^{
//        b = 3;//这个写法错误，编译器直接报错
//    };
    
    __block int b = 0;//使用__block可修改局部变量
    void (^blo)() = ^{
        b = 3;
         NSLog(@"Input:b=%d",b);
    };
    blo();//输出Input:b=3
    
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    void (^blo1)() = ^{
        [array addObject:@"Obj"];
    };
    blo1();
    NSLog(@"%@",array);
}
#pragma mark 随机数
-(void)showRandomValue{
    int num =     arc4random_uniform(10)+1;

    NSLog(@"arc4random_uniform : %d",num);
}
#pragma mark RN
-(void)helloAction{
    NSURL *jsCodeLocation = [NSURL
                             URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios"];
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL : jsCodeLocation
                         moduleName        : @"WinterAndSpring"
                         initialProperties :
     @{
       @"scores" : @[
               @{
                   @"name" : @"Alex",
                   @"value": @"42"
                   },
               @{
                   @"name" : @"Joel",
                   @"value": @"10"
                   }
               ]
       }
                          launchOptions    : nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    
    [self.navigationController pushViewController:vc animated:YES];
    
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
