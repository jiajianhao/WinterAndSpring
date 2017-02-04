//
//  MyHomeView.m
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "MyHomeView.h"
#import "MyHomeViewModel.h"
#import "MyHomeModel.h"
#import "HomeTableViewCell.h"
#import "HomeSecondTableViewCell.h"
static NSString *CELL1 = @"cell1";
static NSString *CELL2 = @"cell2";
static NSString *CELL3 = @"cell3";
static NSString *CELL4 = @"cell4";


@implementation MyHomeView



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:240.0/255.0f green:240.0/255.0f blue:240.0/255.0f alpha:1.0];
        _viewModel = [[MyHomeViewModel alloc]init];
        
        [self m_creatviews];
    }
    return self;
}
-(void)m_creatviews{
    [self tableView];
    
}
- (UITableView *)tableView
{
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] init];
        
        [self addSubview: _tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(mWidth, mHeight-64-49));
            make.left.equalTo(self.mas_left);
            make.top.equalTo(self.mas_top);
        }];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        __weak typeof(self) weakSelf = self;
        
        NSString * cellReuseIdentifier = NSStringFromClass([UITableViewCell class]);
        
        [_tableView registerClass: NSClassFromString(cellReuseIdentifier) forCellReuseIdentifier:cellReuseIdentifier];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            [weakSelf getMyData];
        }];
        
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf getMyData];
            
        }];
        
        [_tableView.mj_header beginRefreshing];
        
    }
    
    return _tableView;
}

-(void)getMyData{
    __weak typeof(self) weakSelf = self;
    
    [_viewModel setBlockWithReturnBlock:^(id returnvalue){
        NSLog(@"returnvalue:%@",returnvalue);
        //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:returnvalue options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"%@",dic);
        //NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:returnvalue options:NSJSONReadingMutableContainers error:nil];
        if ([returnvalue isKindOfClass:[NSDictionary class]]) {
            
            NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:returnvalue];
            
            weakSelf.model = [MyHomeModel yy_modelWithJSON:dic];
//            NSLog(@"title : %@",weakSelf.model.title);
            NSMutableArray *arr =dic[@"tags"];
//            NSLog(@"images : %@",arr);
            [weakSelf.viewModel.listArray removeAllObjects];
            MyHomeModel_Image *model_image = [MyHomeModel_Image yy_modelWithJSON:dic[@"images"]];
            
            
            for (int i =0; i<500; i++) {
                for (int j=0; j<[arr count]; j++) {
                    NSDictionary *dic1 = [arr objectAtIndex:j];
                    MyHomeModel_Cell *model1 = [MyHomeModel_Cell yy_modelWithJSON:dic1];
                    NSLog(@"%@",model1.name);
                    model1.name=[NSString stringWithFormat:@"%d %@",(int)(i*[arr count]+j),model1.name];
                    model1.image =model_image.small;
                    [weakSelf.viewModel.listArray addObject:model1];
                    
                }
                //                for (NSDictionary *dic1 in arr) {
                //                    MyHomeModel_Cell *model1 = [MyHomeModel_Cell yy_modelWithJSON:dic1];
                //                    NSLog(@"%@",model1.name);
                //                    model1.name=[NSString stringWithFormat:@"%d %@",,model1.name];
                //                    model1.image =model_image.small;
                //                    [weakSelf.viewModel.listArray addObject:model1];
                //                }
            }
            
            
            
            
            //            [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(refreshMyView) userInfo:nil repeats:NO];//设置执行时间
            
            
            
        }
        
        [weakSelf endRefresh];
        [weakSelf.tableView reloadData];
        
        
        
    }];
    [_viewModel readMyData];
    
    
}
-(void)endRefresh{
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_viewModel.listArray count];
    //    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",(int)indexPath.row);

    if(indexPath.row%2==1){
    
    static NSString *CellIdentifier = @"HomeTableViewCell";

    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // 如果从集合中未找到单元格,也就是集合中还没有单元格,也就是还没有单元格出屏幕,那么我们就需要创建单元格
    if (!cell)
    {
        // 创建cell的时候需要标示符(Identifier)是因为,当该cell出屏幕的时候需要根据标示符放到对应的集合中.
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HomeTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        //        if (!cell){
        //            [tableView registerNib:[UINib nibWithNibName:@"HomeSimpleTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeSimpleTableViewCell"];
        //            cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSimpleTableViewCell"];
        //         }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    MyHomeModel_Cell *model_cell = [_viewModel.listArray objectAtIndex:indexPath.row];
    
    cell.myModel_cell=model_cell;
    
    [cell handlerInvestButtonAction:^(NSInteger m){
        if (self.buttonBlock) {
            self.buttonBlock(m);
        }
    }];
    
    return cell;
    }
    
    else{
        static NSString *CellIdentifier = @"HomeSecondTableViewCell";
        
        HomeSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        // 如果从集合中未找到单元格,也就是集合中还没有单元格,也就是还没有单元格出屏幕,那么我们就需要创建单元格
        if (!cell)
        {
            // 创建cell的时候需要标示符(Identifier)是因为,当该cell出屏幕的时候需要根据标示符放到对应的集合中.
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HomeSecondTableViewCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
            //        if (!cell){
            //            [tableView registerNib:[UINib nibWithNibName:@"HomeSimpleTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeSimpleTableViewCell"];
            //            cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSimpleTableViewCell"];
            //         }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
         MyHomeModel_Cell *model_cell = [_viewModel.listArray objectAtIndex:indexPath.row];
        
        cell.myModel_cell=model_cell;
        
        [cell handlerInvestButtonAction:^(NSInteger m){
            if (self.buttonBlock) {
                self.buttonBlock(m);
            }
        }];
        
        return cell;
    }
}

#pragma mark 按钮事件
-(void)buttonAction:(UIButton*)sender{
    NSLog(@"hello");
    
    if (self.buttonBlock) {
        self.buttonBlock(sender.tag);
    }
}

-(void)handlerButtonAction:(HomeViewBlock)block{
    self.buttonBlock=block;
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
