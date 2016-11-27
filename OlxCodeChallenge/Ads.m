//
//  Ads.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "Ads.h"

@implementation Ads

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"adsID" : @"id",
             @"adsTitle" : @"title",
             @"adsDescription" : @"description",
             @"adsPrice" : @"price_numeric",
             @"adsLat" : @"map_lat",
             @"adsLong" : @"map_lon",
             @"adsCity" : @"city_label",
             @"adsPerson" : @"person",
             @"adsDate" :@"created"
             };
}



@end
