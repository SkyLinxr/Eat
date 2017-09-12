//
//  ViewController.m
//  Eat
//
//  Created by Skylin on 2017/8/31.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "ViewController.h"
#import "Choose_ViewController.h"
#import "Edit_ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"功能";
    [self makeUI];
}
-(void)makeUI
{
    NSArray * btnTitleArr = @[@"选择",@"编辑"];
    
    for (int i=0; i<btnTitleArr.count; i++) {
        UIButton * btn = [GJ_Control createButtonWithFrame:CGRectMake(0, 100+i*200, 100, 100) SetImage:nil SetBackgroundImage:nil Target:self Action:@selector(BtnClick:) Title:btnTitleArr[i] setBackgroundColorWithSys:RandomColor setTitleColor:[UIColor whiteColor] setTag:100+i];
        btn.center = CGPointMake(IPHONE_WIDTH/2, btn.center.y);
        btn.layer.cornerRadius = 50;
        btn.layer.masksToBounds = YES;
        [self.view addSubview:btn];
    }
}
-(void)BtnClick:(UIButton *)btn
{
    int tag = (int)btn.tag;
    if (tag==100) { //选择
        VC_PUSH(Choose_ViewController);
    }else{          //编辑
        VC_PUSH(Edit_ViewController);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
