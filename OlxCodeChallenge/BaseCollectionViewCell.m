//
//  BaseCollectionViewCell.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell


+(NSString *)cellIdentifier {
    NSString *identifier = NSStringFromClass(self.class);
    return identifier;
}

-(void)setup:(id)object {
    
}

+(void)registerForCollectionView:(UICollectionView *)collectionview {
    NSString *identifier = NSStringFromClass(self.class);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [collectionview registerNib:nib forCellWithReuseIdentifier:identifier];
    
}
@end
