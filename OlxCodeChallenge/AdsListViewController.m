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
#import "AdsModelContainer.h"
#import "AdsListCell.h"
#import "DetailPageViewController.h"

typedef void (^LoadEnds)();
typedef void (^RefreshEnds)();

@interface AdsListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *adsCollectionView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic)NSArray *adsArray;
@property (assign, nonatomic) BOOL isRefreshing;


@end

@implementation AdsListViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupRefresher];
    
    [self fetchAdsList];
    
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
        self.adsArray = [AdsModelContainer sharedManager].adsList;
     
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

#pragma mark - CollectionView Delegates/DataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.adsArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self collectionView:collectionView adsCellForRowAt:indexPath];
    
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   [AdsModelContainer sharedManager].indexPath = indexPath;
    
    return YES;
}


-(AdsListCell *)collectionView:(UICollectionView *)collectionView adsCellForRowAt:(NSIndexPath *)indexPath {
    AdsListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AdsListCell cellIdentifier] forIndexPath:indexPath];
    
    [cell setup:[_adsArray objectAtIndex:indexPath.row]];
    
    return cell;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [AdsListCell cellSizeForContainer:_adsCollectionView.bounds
                              withMinSpacing:3.f
                                  andMarging:3.f
                      andNumberOfCellsPerRow:2];
}

#pragma mark - PullToRefresh

-(void)pullToRefresh {
    
    if (!_isRefreshing) {
        _isRefreshing = YES;
        
        [self refreshBegins:^{
            self.isRefreshing = NO;
            [self.refreshControl endRefreshing];
            [self.adsCollectionView reloadData];
        }];
    }
}

-(void)refreshBegins:(RefreshEnds)refreshEnds {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self fetchAdsList];
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            refreshEnds();
        });
    });
}
















@end
