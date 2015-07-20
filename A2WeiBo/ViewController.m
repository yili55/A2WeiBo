//
//  ViewController.m
//  A2WeiBo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "ViewController.h"
#import "YLStatusModel.h"
#import "YLStatusCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *statuses;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)YLStatusCell *cell;
@end

@implementation ViewController
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cell=[YLStatusCell statuCellWithTableView:tableView];
    YLStatusModel *model=[self.statuses objectAtIndex:indexPath.row];
    _cell.status=model;
   // _cell.textLabel.text=model.name;
    return _cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _cell.cellHeight;
}
-(NSArray *)statuses
{
    if (_statuses == nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"statuses" ofType:@"plist"];
        NSArray *statuaArray=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray * objs=[NSMutableArray array];
        for (NSDictionary *dic in statuaArray) {
            YLStatusModel *statusModel=[YLStatusModel statusWithDic:dic];
            [objs addObject:statusModel];
       }
        _statuses=objs;
    }
    return _statuses;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    //self.statuses;
   // NSLog(@"%@",self.statuses);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
