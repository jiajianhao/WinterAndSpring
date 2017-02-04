//
//  BusinessViewController.m
//  WinterAndSpring
//
//  Created by admin on 2017/2/3.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BusinessViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface BusinessViewController ()

@end

@implementation BusinessViewController
void dynamicMethodIMP(id self, SEL _cmd){
    NSLog(@"doSomthing SEL");
}
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if(sel == @selector(doSomething)){
        NSLog(@"add method here!");
        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self performSelector:@selector(doSomething:)];
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
