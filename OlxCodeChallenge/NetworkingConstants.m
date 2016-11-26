//
//  NetworkingConstants.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "NetworkingConstants.h"

# pragma mark - Base
NSString *const kApiBaseURL = @"http://olx.pt/i2/ads/?json=1&search[category_id]=25";

# pragma mark - HTTP Status code
NSString *const kBadRequestStatus = @"400";
NSString *const kUnauthorizedStatus = @"401";
NSString *const kForbiddenStatus = @"403";
NSString *const kNotFoundStatus = @"404";
NSString *const kConflictStatus = @"409";
NSString *const kPreconditionFailedStatus = @"412";
NSString *const kInternalServerErrorStatus = @"500";
NSString *const kServiceUnavailableStatus = @"503";

