//
//  IndexViewController.m
//  BaseWebViewDemo
//
//  Created by 宋志明 on 15/9/24.
//  Copyright (c) 2015年 宋志明. All rights reserved.
//

#import "IndexViewController.h"
#import "HomeViewController.h"
#import "TestWebViewController.h"
#import "TestXibAddBaseWebViewController.h"
@interface IndexViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableViewDelegate & TableViewDatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *id = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:id];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    if(indexPath.row == 0){
        cell.textLabel.text = @"使用自定义 baswWebview ";
    }else{
        cell.textLabel.text = @"ios8 wkwebview的使用";
    }
    return cell;
}
//设置单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 44;
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:0.5 delay:0.25*indexPath.row options:UIViewAnimationOptionCurveEaseInOut animations:^{
        cell.contentView.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width,0);
    } completion:^(BOOL finished) {
        
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        TestWebViewController *vc = [[TestWebViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(indexPath.row == 1){
        HomeViewController *vc = [[HomeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        TestXibAddBaseWebViewController *vc = [[TestXibAddBaseWebViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
