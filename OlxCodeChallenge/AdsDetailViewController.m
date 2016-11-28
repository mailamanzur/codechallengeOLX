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
#import <MapKit/MapKit.h>

@interface AdsDetailViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *mapsButton;

@end

@implementation AdsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self.mapsButton setTitle:self.ads.adsCity forState:UIControlStateNormal];
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

- (IBAction)showMap:(id)sender {
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(_ads.adsLat.doubleValue,_ads.adsLong.doubleValue);
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate addressDictionary:nil];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    [mapItem setName:_ads.adsCity];
    

    [MKMapItem openMapsWithItems:@[mapItem] launchOptions:nil];
    
}


@end
