//
//  BaseMantleObject.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "BaseMantleObject.h"

@implementation BaseMantleObject

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return [NSDictionary mtl_identityPropertyMapWithModel:self.class];
}

-(NSDictionary *)asDictError:(NSError *__autoreleasing *)error {
    return [MTLJSONAdapter JSONDictionaryFromModel:self error:error];
    
}

+(instancetype)parse:(NSDictionary *)dc error:(NSError *__autoreleasing *)error {
    return [MTLJSONAdapter modelOfClass:self.class
                     fromJSONDictionary:dc
                                  error:error];
}

+(NSArray *)asArrayOfDictFromModelArray:(NSArray *)objects error:(NSError *__autoreleasing *)error {
    return [MTLJSONAdapter JSONArrayFromModels:objects error:error];
}

+(NSArray *)parseArray:(NSArray *)objects error:(NSError *__autoreleasing *)error {
    return [MTLJSONAdapter modelsOfClass:self.class
                           fromJSONArray:objects
                                   error:error];
}
@end
