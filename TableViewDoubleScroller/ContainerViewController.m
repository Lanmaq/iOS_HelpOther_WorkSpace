//
//  ContainerViewController.m
//  TableViewDoubleScroller
//
//  Created by zml on 15/11/23.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.
//

#import "ContainerViewController.h"


@interface ContainerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ContainerViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrooll:) name:@"DownWillDisplayHeadNotification" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrooll:) name:@"UpEndDisplayingHeadNotification" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"index %ld",(long)indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"MarkerFelt-Thin" size:16];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"RemoteContainerSelectedNotification" object:[NSNumber numberWithInteger:indexPath.row]];
    [self.parentViewController setValue:[NSNumber numberWithBool:YES] forKey:@"remoteContainerSelectedAction"];
}

#pragma mark - Private method
- (void)scrooll:(NSNotification *)noti
{
    NSInteger _rowIndex  = [noti.object integerValue];
    NSIndexPath *index = [NSIndexPath indexPathForRow:_rowIndex inSection:0];

    [self.tableView selectRowAtIndexPath:index animated:NO scrollPosition:UITableViewScrollPositionNone];
}

@end
