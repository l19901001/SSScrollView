//
//  ViewController.m
//  UIScrollViewDemo
//
//  Created by lss on 16/5/4.
//  Copyright © 2016年 lss. All rights reserved.
//

#import "ViewController.h"
#import "SSScrollView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SSScrollView *headerView;
/**
 *  测试图片数据
 */
@property (nonatomic, strong) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    
    _headerView = [[SSScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150) DragDirection:HeaderViewDragDirectionVertical];
    _headerView.contentStyle = HeaderViewScrollViewLableStyle;
    _headerView.rollingTime = 3.0;
    [_headerView reloadheaderViewWithDatas:self.images];
    _tableView.tableHeaderView = _headerView;
    
    [self.view addSubview:_tableView];
}

-(NSArray *)images
{
    if(!_images){
        _images = @[@"indexBASearchIcon0", @"indexBASearchIcon1", @"indexBASearchIcon2",
                    @"indexBASearchIcon3", @"indexBASearchIcon4", @"indexBASearchIcon5",];
    }
    
    return _images;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.images.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.text = [self.images objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
