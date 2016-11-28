//
//  BaseCollectionViewCell.h
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionViewCell : UICollectionViewCell

+(NSString *)cellIdentifier;

-(void)setup:(id)object;

+(void)registerForCollectionView:(UICollectionView *)collectionview;


@end
