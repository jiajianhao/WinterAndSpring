//
//  SingleView.m
//  WinterAndSpring
//
//  Created by admin on 2017/1/10.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "SingleView.h"
#import <React/RCTRootView.h>

@interface SingleView ()<UITextFieldDelegate>


@end
@implementation SingleView





- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:240/255.f green:241/255.f blue:241/255.f alpha:1.0];
        
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI{
    
  
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(11*(mWidth/375), 12*(mHeight/667), mWidth/2, 15)];
    _nameLabel.text = @"啊哈";
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textColor = [UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1.0];
    [self addSubview:_nameLabel];
    
     _telLabel = [[UILabel alloc]initWithFrame:CGRectMake(11*(mWidth/375)+60, 12*(mHeight/667), mWidth/2, 15)];
    
    _telLabel.font = [UIFont systemFontOfSize:15];
    _telLabel.textColor = [UIColor colorWithRed:51/255.f green:51/255.f blue:51/255.f alpha:1.0];
    _telLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_telLabel];
    
     _helloBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _helloBtn.frame = CGRectMake(mWidth-30-11*(mWidth/375), 12*(mHeight/667), 32, 15);
    [_helloBtn setTitle:@"你好" forState:UIControlStateNormal];
    [_helloBtn setTitleColor:[UIColor colorWithRed:68/255.f green:113/255.f blue:188/255.f alpha:1.0] forState:UIControlStateNormal];
    _helloBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_helloBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _helloBtn.tag=0;
    [self addSubview:_helloBtn];
    
    /////
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(11*(mWidth/375), 12*(mHeight/667)+30, mWidth/2, 15)];
    _titleLabel.text = @"啊哈";
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = [UIColor colorWithRed:153/255.f green:153/255.f blue:153/255.f alpha:1.0];
    [self addSubview:_titleLabel];

    
    _arc4RandomBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
    _arc4RandomBtn.frame = CGRectMake(mWidth-30-11*(mWidth/375), 12*(mHeight/667)+30, 32, 15);
    [_arc4RandomBtn setTitle:@"suiji" forState:UIControlStateNormal];
    [_arc4RandomBtn setTitleColor:[UIColor colorWithRed:68/255.f green:113/255.f blue:188/255.f alpha:1.0] forState:UIControlStateNormal];
    _arc4RandomBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_arc4RandomBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _arc4RandomBtn.tag=1;
    [self addSubview:_arc4RandomBtn];

    
}

-(void)buttonAction:(UIButton*)sender{
    NSLog(@"hello");
  
    if (self.buttonBlock) {
        self.buttonBlock(sender.tag);
    }
 }
 
-(void)handlerButtonAction:(SingleViewBlock)block{
    self.buttonBlock=block;

}

 //点击空白关闭键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self endEditing:YES];
    
}


//- (void)textFieldDidBeginEditing:(UITextField *)textField{
//
//    _countFiled.textColor = [UIColor blackColor];
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField{
//
//    _countFiled.textColor = [UIColor blackColor];
//
//
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
