//
//  AdsApiManager.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "AdsApiManager.h"
#import "NetworkingConstants.h"
#import "AdsResponse.h"

@implementation AdsApiManager

+(AdsApiManager *)sharedManager {
    static AdsApiManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(id)init {
    if (self = [super init]) {
        [self setupWithHttps];
    }
    return self;
}

#pragma mark - GET Methods

-(void)fetchAds:(AdsSuccessBlock)sucess failure:(AdsFailureBlock)failure {
    
    [self GET:kApiBaseURL params:nil success:^(NSURLSessionTask *operation, id responseObject) {
        NSError *error;
        
        AdsResponse *response  = [AdsResponse parse:responseObject error:&error];
        if (response)
            sucess(response);
         else
             sucess(nil);
        
    
    } failure:^(NSURLSessionTask *operation, NSError *error, NSString *customErrorMessage) {
        failure([error localizedDescription]);
        
    }];
}

@end
