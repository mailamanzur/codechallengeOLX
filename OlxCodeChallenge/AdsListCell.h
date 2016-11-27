//
//  AdsListCell.h
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface AdsListCell : BaseCollectionViewCell

+(CGSize)cellSizeForContainer:(CGRect)bounds
               withMinSpacing:(CGFloat)minSpacing
                   andMarging:(CGFloat)margin
       andNumberOfCellsPerRow:(NSInteger)cellsPerRow;

@end
