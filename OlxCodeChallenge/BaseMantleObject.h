//
//  BaseMantleObject.h
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import <Mantle/Mantle.h>


@interface BaseMantleObject : MTLModel<MTLJSONSerializing>

+(NSDictionary *)JSONKeyPathsByPropertyKey;
+(instancetype)parse:(NSDictionary *)dc error:(NSError **)error;
-(NSDictionary *)asDictError:(NSError **)error;

+(NSArray *)asArrayOfDictFromModelArray:(NSArray *)objects error:(NSError **)error;
+(NSArray *)parseArray:(NSArray *)objects error:(NSError **)error;

@end
