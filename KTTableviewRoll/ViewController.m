//
//  ViewController.m
//  KTTableviewRoll
//
//  Created by keenteam on 2018/5/2.
//  Copyright © 2018年 keenteam. All rights reserved.
//
#define YXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#import "ViewController.h"
#import "NewsHomeWorkViewController.h"
#import "NoticeInfomationViewController.h"
#import "AttendanceNewViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray* informationArr;
@property (nonatomic, strong)UITableView * newstableView;
/*timer**/
@property (nonatomic, strong) NSTimer *timer;
/*count**/
@property (nonatomic, assign) NSInteger count;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.timer fire];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.newstableView];
    [self performSelector:@selector(openCycle) withObject:self afterDelay:0.5];
}

- (void)openCycle
{
    [self.timer fire];
    _count = 0;
    
}

#pragma mark - timer target
- (void)autoScroll
{
    _count += 40;
    [self.newstableView setContentOffset:CGPointMake(0, _count) animated:YES];
}

//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

//每组行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.informationArr.count*1000;;
    
}

//每组高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

//组头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.001;
    
}

//尾部高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
    
}

//尾部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return [UIView new];
}

//点击跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_newstableView == tableView) {
        
        switch (indexPath.row%3) {
            case 0:
                [self myHomeWorkInfomation];
                break;
            case 1:
                [self myNewsInfomation];
                break;
            case 2:
                [self myAttendanceInfomation];
                break;
            default:
                break;
        }
        
    }
    
}

//消息提醒-我的作业
- (void)myHomeWorkInfomation{
    
    NewsHomeWorkViewController * homeWorkInfoVC = [[NewsHomeWorkViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:homeWorkInfoVC];
    homeWorkInfoVC.title = @"我的考勤";
    [self presentViewController:nav animated:NO completion:nil];
    
}

//消息提醒-我的通知
- (void)myNewsInfomation{
    
    NoticeInfomationViewController * homeWorkInfoVC = [[NoticeInfomationViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:homeWorkInfoVC];
    homeWorkInfoVC.title = @"我的考勤";
    [self presentViewController:nav animated:NO completion:nil];
    
}

//消息提醒-我的考勤
- (void)myAttendanceInfomation{
    
    AttendanceNewViewController * homeWorkInfoVC = [[AttendanceNewViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:homeWorkInfoVC];
    homeWorkInfoVC.title = @"我的考勤";
    [self presentViewController:nav animated:NO completion:nil];
    
}

//cell定制
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellName =@"YXPersonalCenterOneCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        cell.backgroundColor =YXColor(255, 255, 255);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.informationArr[indexPath.row%3];
    
    return cell;
    
}

#pragma mark --------------- 懒加载 tableView -----------------
-(UITableView *)newstableView{
    if (!_newstableView) {
        _newstableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100 , self.view.frame.size.width, 120) style:UITableViewStylePlain];
        _newstableView.delegate = self;
        _newstableView.backgroundColor = YXColor(245, 245, 245);
        _newstableView.showsVerticalScrollIndicator = NO;
        _newstableView.dataSource = self;
    }
    return _newstableView;
}

#pragma mark --------------- 懒加载 informationArr -----------------
-(NSMutableArray *)informationArr{
    
    NSArray * titleArr = @[@"10:00 [数学] 已经发布了2018/4/4的数学作业",@"10:20 [语文] 发布了2018/4/5的通知",@"10:50 [张三] 2018/4/4的考勤正常/异常"];
    if (!_informationArr) {
        _informationArr = [[NSMutableArray alloc]init];
        
        for (int i =0; i<3; i++) {
        
            [_informationArr addObject:titleArr[i]];
        }
        
    }
    
    return _informationArr;
}

- (NSTimer *)timer {
    
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
