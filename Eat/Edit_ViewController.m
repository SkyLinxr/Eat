//
//  Edit_ViewController.m
//  Eat
//
//  Created by Skylin on 2017/8/31.
//  Copyright © 2017年 Sky. All rights reserved.
//

#import "Edit_ViewController.h"
#import "GJ_Control.h"

@interface Edit_ViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UITextFieldDelegate>
{
    NSInteger selectIndex;
}
@property(nonatomic,strong)NSMutableArray * dataArr;
@property(nonatomic,strong)UITableView * mainTableView;
@property(nonatomic,strong)UIView * addDataView;
@property(nonatomic,strong)UIButton * addDataBtn;
@property(nonatomic,strong)UITextField * addDataTextField;
@end

@implementation Edit_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.addDataView];
    [self.view addSubview:self.mainTableView];
    self.title = @"编辑";
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [GetUserDefaults(k_UserDefine_EatList) mutableCopy];
    }
    return _dataArr;
}
-(UIView *)addDataView
{
    if (!_addDataView) {
        _addDataView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, IPHONE_WIDTH, 45)];
        _addDataView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:_addDataView];
        
        _addDataBtn = [GJ_Control createButtonWithFrame:CGRectMake(IPHONE_WIDTH-60, 0, 60, 45) SetImage:nil SetBackgroundImage:nil Target:self Action:@selector(BtnClick:) Title:@"添加" setBackgroundColorWithSys:nil setTitleColor:[UIColor blueColor] setTag:100];
        [_addDataView addSubview:_addDataBtn];
        
        _addDataTextField = [GJ_Control createTextFieldWithFrame:CGRectMake(10, 5, IPHONE_WIDTH-60-20, 35) placeholder:@"在此输入添加" passWord:NO leftImageView:nil rightImageView:nil Font:15 backgRoundImageName:nil setText:nil setTextBorderStyle:UITextBorderStyleRoundedRect setKeyboardType:UIKeyboardTypeDefault setTextAlignment:NSTextAlignmentCenter setTag:1];
        [_addDataTextField setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
        _addDataTextField.delegate = self;
        _addDataTextField.returnKeyType = UIReturnKeyJoin;
        [_addDataView addSubview:_addDataTextField];
    }
    return _addDataView;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self EditDidDone];
    return YES;
}
-(void)BtnClick:(UIButton *)btn
{
    [self EditDidDone];
}
-(void)EditDidDone
{
    [self.view endEditing:YES];
    if (STRING_IS_NOT_EMPTY(_addDataTextField.text)) {
        [self.dataArr addObject:_addDataTextField.text];
        [self.mainTableView reloadData];
        _addDataTextField.text = nil;
        SaveUserDefaults(k_UserDefine_EatList, self.dataArr);
    }
}
-(UITableView *)mainTableView
{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 45, IPHONE_WIDTH, NOHAVE_TABBAR_HEIGHT-45) style:UITableViewStylePlain];
        _mainTableView.backgroundColor = [UIColor whiteColor];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [self.view addSubview:_mainTableView];
    }
    return _mainTableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CELL_NAME(UITableViewCell, @"cell", [UIColor whiteColor]);
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectIndex = indexPath.row;
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"确定要删除" message:self.dataArr[indexPath.row] delegate:self cancelButtonTitle:@"删除" otherButtonTitles:@"取消", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (!buttonIndex) {
        [self.dataArr removeObjectAtIndex:selectIndex];
        [self.mainTableView reloadData];
        SaveUserDefaults(k_UserDefine_EatList, self.dataArr);
    }
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
