//
//  HomeTableViewCell.m
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "MyHomeModel.h"
#import "HomeDetailViewController.h"
@interface HomeTableViewCell()
@property (nonatomic,strong)UIImageView *imgview;
@property (nonatomic,strong)UILabel *label_name;
@property (nonatomic,strong)UILabel *label_title;
@property (weak, nonatomic)  UIButton *investButton;
@end
@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self creatSubviews];
    
}

-(void)creatSubviews{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@""]];
    [imgView setBackgroundColor:[UIColor clearColor]];
    self.imgview = imgView;
    [self addSubview:imgView];
    
    
    
    //标题
    UILabel *titleName = [[UILabel alloc] init];
    titleName.textColor = [UIColor blackColor];
    titleName.font = [UIFont systemFontOfSize:20];
    titleName.textAlignment = NSTextAlignmentLeft;
    titleName.text = @"标题";
    self.label_name = titleName;
    [self addSubview:titleName];
    
    
    //标签1
    UILabel *label1 = [[UILabel alloc] init];
    label1.textColor = [UIColor colorWithHex:0x49B4FF];
//    label1.backgroundColor = [UIColor colorWithHex:0x49B4FF alpha:0.1 ];
    label1.font = [UIFont systemFontOfSize:15];
    label1.textAlignment = NSTextAlignmentLeft;
    label1.text = @"内容";
    self.label_title = label1;
    [self addSubview:label1];
    
    UIButton *investButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [investButton setBackgroundColor:[UIColor colorWithHex:0xff5000]];
//    [investButton setImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
//    [investButton setImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateHighlighted];
    [investButton setTitle:@"详情" forState:UIControlStateNormal];
    [investButton addTarget:self action:@selector(investAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.investButton=investButton;
    [self addSubview:investButton];
    
    
}


-(void)setMyModel_cell:(MyHomeModel_Cell *)myModel_cell{
    
    
    [self.imgview sd_setImageWithURL:[NSURL URLWithString:myModel_cell.image]];
    [self.label_name setText:myModel_cell.name];
    [self.label_title setText:myModel_cell.title];
    
    [self resetFrame];

}

-(void)resetFrame{
    [self.imgview mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.top.equalTo(self.mas_top).offset((self.frame.size.height-60)/2);
        make.left.equalTo(self.mas_left).offset(10);

    }];
    
    [self.label_name mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(100, 25));
        make.left.equalTo(self.mas_left).offset(80);
        make.top.equalTo(self.imgview);

        
    }];
    
    [self.label_title mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(200, 20));
        make.left.equalTo(self.mas_left).offset(80);
        make.bottom.equalTo(self.imgview);

    }];

    [self.investButton mas_makeConstraints:^(MASConstraintMaker *make){
        make.size.mas_equalTo(CGSizeMake(60, 44));
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.mas_top).offset((self.frame.size.height-44)/2);
        
    }];

}
-(void)investAction:(UIButton *)sender {
    if (self.buttonBlock) {
        self.buttonBlock(_index);
    }
}

-(void)handlerInvestButtonAction:(InvestBlock)block{
    self.buttonBlock=block;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        NSLog(@"sdsdsdsds");
        if (self.buttonBlock) {
            self.buttonBlock(_index);
        }
    }
    // Configure the view for the selected state
}


@end
