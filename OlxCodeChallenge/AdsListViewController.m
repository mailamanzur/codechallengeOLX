//
//  AdsListViewController.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "AdsListViewController.h"
#import "AdsApiManager.h"

@interface AdsListViewController ()

@end

@implementation AdsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[AdsApiManager sharedManager]fetchAds:^(id response) {
        
    } failure:^(NSString *errorMsg) {
      
    }];
}



@end
