//
//  AdsDetailViewController.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 27/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "AdsDetailViewController.h"
#import "AdsDetailTableViewCell.h"
#import "Ads.h"

@interface AdsDetailViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation AdsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
}

-(void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    
}

#pragma mark - TableView Delegate/DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self tableView:tableView adsCellForRowAt:indexPath];
    
}

-(AdsDetailTableViewCell *)tableView:(UITableView *)tableView adsCellForRowAt:(NSIndexPath *)indexPath {
    AdsDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[AdsDetailTableViewCell cellIdentifier] forIndexPath:indexPath];
    [cell setup:_ads];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200.0;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [AdsDetailTableViewCell cellHeight];
    
}

@end
