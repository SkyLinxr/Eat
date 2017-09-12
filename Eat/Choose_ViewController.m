//
//  Choose_ViewController.m
//  Eat
//
//  Created by Skylin on 2017/8/31.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "Choose_ViewController.h"

@interface Choose_ViewController ()
{
    UILabel * showLabel;
    UIButton * startBtn;
}
@property(nonatomic,strong)NSArray * dataArr;
@end

@implementation Choose_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"选择";
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeUI];
}
-(NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = GetUserDefaults(k_UserDefine_EatList);
    }
    return _dataArr;
}
-(void)makeUI
{
    showLabel = [GJ_Control createLabelWithFrame:CGRectMake(20, 100, IPHONE_WIDTH-40, 35) Font:15 Text:@"点击按钮开始" setColor:RandomColor numberOfLines:1 textAlignment:NSTextAlignmentCenter];
    showLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.view addSubview:showLabel];
    
    startBtn = [GJ_Control createButtonWithFrame:CGRectMake(0, NOHAVE_TABBAR_HEIGHT-200, 100, 100) ImageName:nil Target:self Action:@selector(StartAction) Title:@"开始" setBackgroundColorWithSys:RandomColor setTitleColor:[UIColor whiteColor]];
    startBtn.layer.cornerRadius = 50;
    startBtn.layer.masksToBounds = YES;
    startBtn.center = CGPointMake(IPHONE_WIDTH/2, startBtn.center.y);
    [self.view addSubview:startBtn];
}

-(void)StartAction
{
    int randIndex = 0;
    static int selectIndex = 0;
    do {
        randIndex = RandomNumBer(self.dataArr.count);
        showLabel.font = [UIFont boldSystemFontOfSize:35];
        showLabel.textColor = RandomColor;
        showLabel.text = self.dataArr[randIndex];        
    } while (randIndex == selectIndex);//避免随机选项与上一个相同
    
    selectIndex = randIndex;
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
