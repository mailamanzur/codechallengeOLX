//
//  AdsListViewController.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "AdsListViewController.h"
#import "AdsApiManager.h"
#import  <MBProgressHUD/MBProgressHUD.h>
#import "AdsModelContainer.m"

typedef void (^LoadEnds)();
typedef void (^RefreshEnds)();

@interface AdsListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *adsCollectionView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (assign, nonatomic) BOOL isRefreshing;

@end

@implementation AdsListViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
 
}


#pragma  mark View setup

-(void)setupCollectionView {
    self.adsCollectionView.dataSource = self;
    self.adsCollectionView.delegate = self;
    [self.adsCollectionView reloadData];
    
}

-(void)setupRefresher {
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self action:@selector(pullToRefresh) forControlEvents:UIControlEventValueChanged];
    [self.adsCollectionView addSubview:self.refreshControl];
}

#pragma mark - Api Calls

-(void)fetchAdsList {
    if (!_isRefreshing)
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [[AdsApiManager sharedManager]fetchAds:^(id response) {
        [AdsModelContainer sharedManager].adsList = response;
        if (!_isRefreshing) {
            [self setupCollectionView];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
        
    } failure:^(NSString *errorMsg) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Erro" message:errorMsg preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *fechar = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:fechar];
        [self presentViewController:alert animated:YES completion:nil];
        
        if (!_isRefreshing)
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        
    }];
}

@end
