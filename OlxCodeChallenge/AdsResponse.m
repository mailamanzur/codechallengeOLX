//
//  AdsResponse.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "AdsResponse.h"
#import "Ads.h"

@implementation AdsResponse

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"adsArray" : @"ads"
             };
}

+(NSValueTransformer *)adsArrayJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:[Ads class]];
}

@end
