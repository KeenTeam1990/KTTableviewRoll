//
//  AttendanceNewViewController.m
//  KTTableviewRoll
//
//  Created by keenteam on 2018/5/2.
//  Copyright © 2018年 keenteam. All rights reserved.
//

#import "AttendanceNewViewController.h"

@interface AttendanceNewViewController ()

@end

@implementation AttendanceNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLeftItemBar];
    self.view.backgroundColor = [UIColor whiteColor];
}

/**创建左导航按钮*/
- (void)createLeftItemBar{
    
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor blackColor]}];
    UIButton * leftBtn  = [[UIButton alloc]init];
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
}

/**点击返回按钮*/
- (void)clickLeftBtn{
    
    [self dismissViewControllerAnimated:NO completion:nil];
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
