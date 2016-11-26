//
//  Ads.h
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "BaseMantleObject.h"

@interface Ads : BaseMantleObject
@property (strong, nonatomic) NSString *adsID;
@property (strong, nonatomic) NSString *adsTitle;
@property (strong, nonatomic) NSString *adsDescription;
@property (strong, nonatomic) NSString *adsPrice;
@property (strong, nonatomic) NSString *adsLat;
@property (strong, nonatomic) NSString *adsLong;
@property (strong, nonatomic) NSString *adsCity;
@property (strong, nonatomic) NSString *adsPerson;

@end
