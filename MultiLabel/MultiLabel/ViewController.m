//
//  ViewController.m
//  MultiLabel
//
//  Created by 赵博 on 17/4/19.
//  Copyright © 2017年 赵博. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.rowHeight = 195;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];

    _titleArray = @[@"全部",@"钢琴",@"吉他",@"电吉他",@"小提琴",@"架子鼓",@"口琴",@"贝斯",@"卡祖笛",@"古筝",@"翻弹",@"音乐",@"指弹",@"千本樱",@"民乐",@"初音MIKU",@"ANIMENZ",@"PENBEAT",@"木吉他",@"二胡",@"COVER",@"交响",@"权御天下",@"普通DISCO",@"OP",@"ILEM",@"原创",@"作业用BGM",@"串烧",@"东方",@"合奏",@"燃向",@"触手",@"试奏",@"ACG指弹",@"武士桑",@"触手猴",@"BGM",@"LAUNCHPAD"];
    
}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    cell.titleArray = _titleArray;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
