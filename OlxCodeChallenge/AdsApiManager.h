//
//  AdsApiManager.h
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "ApiNetworkingManager.h"

typedef void (^AdsSuccessBlock)(id response);
typedef void (^AdsFailureBlock)(NSString *errorMsg);

@interface AdsApiManager : ApiNetworkingManager

+(AdsApiManager *)sharedManager;

-(void)fetchAds:(AdsSuccessBlock)sucess failure:(AdsFailureBlock)failure;




@end
