//
//  AdsModelContainer.h
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AdsModelContainer : NSObject
@property (nonatomic, strong) NSArray *adsList;

+(AdsModelContainer *)sharedManager;

@end
