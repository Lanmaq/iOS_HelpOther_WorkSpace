//
//  ViewController.m
//  TableViewDoubleScroller
//
//  Created by zml on 15/11/22.
//  Copyright © 2015年 zml@lanmaq.com. All rights reserved.
//

#import "ViewController.h"
#import "DetailModel.h"
#import "DetailTableViewCell.h"

typedef NS_ENUM(NSInteger,COScrollDirectionStyle)
{
    ScrollDirectonUnknow = 0,
    ScrollDirectionDown,
    ScrollDirectionUp
};

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataSourceArray;
    NSInteger            _displaySectionIndex;
    CGFloat               _oldContentOffsetY;
}
@property (nonatomic, weak)   IBOutlet UITableView *tableView;
@property (nonatomic, assign) COScrollDirectionStyle scrollDirection;

@end

@implementation ViewController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Test only !!!
    _dataSourceArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0 ; i < 15 ; i++) {
        NSMutableArray *sectionArray = [NSMutableArray array];
        for (int j = 2; j < 6; j ++){
            DetailModel *detailModel = [[DetailModel alloc]initHeadImage:[UIImage imageNamed:[NSString stringWithFormat:@"300-%d.jpeg",j]] name:@"Lanmaq"  detail:@"github.com"];
            [sectionArray addObject:detailModel];
        }
        [_dataSourceArray addObject:sectionArray];
    }
   
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(scrollTableViewSectionIndex:) name:@"RemoteContainerSelectedNotification" object:nil];
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self forKeyPath:@"RemoteContainerSelectedNotification"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_dataSourceArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_dataSourceArray objectAtIndex:section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell configure: [[_dataSourceArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return  [NSString stringWithFormat:@"index-%ld",(long)section];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if (_scrollDirection == ScrollDirectionDown)
    {
        _displaySectionIndex = section;
        if (!_remoteContainerSelectedAction) {
              [[NSNotificationCenter defaultCenter]postNotificationName:@"DownWillDisplayHeadNotification" object:[NSNumber numberWithInteger:_displaySectionIndex]];
        }
      
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(UIView *)view forSection:(NSInteger)section
{
    if (_scrollDirection == ScrollDirectionUp) {
        _displaySectionIndex = section + 1;
        if (!_remoteContainerSelectedAction) {
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"UpEndDisplayingHeadNotification" object:[NSNumber numberWithInteger:_displaySectionIndex]];
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _remoteContainerSelectedAction = NO;
    
    static float currentContentOffsetY = 0;
    currentContentOffsetY = scrollView.contentOffset.y;
    
    if (currentContentOffsetY != _oldContentOffsetY) {
        if (currentContentOffsetY > _oldContentOffsetY && (currentContentOffsetY - _oldContentOffsetY) > 0) {
            _scrollDirection = ScrollDirectionUp;
            _oldContentOffsetY = currentContentOffsetY;
        }
        else if (currentContentOffsetY < _oldContentOffsetY && (_oldContentOffsetY - currentContentOffsetY) > 0) {
             _scrollDirection = ScrollDirectionDown;
            _oldContentOffsetY = currentContentOffsetY;
        }
        else {
            _scrollDirection = ScrollDirectonUnknow;
        }
    }
}

#pragma mark - Private method

- (void)scrollTableViewSectionIndex:(NSNotification *)noti
{
    NSInteger sectionIndex = [noti.object integerValue];
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:sectionIndex];
    [self.tableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionTop animated:NO];
}



@end
