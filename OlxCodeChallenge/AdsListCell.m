//
//  AdsListCell.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 26/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "AdsListCell.h"
#import "Ads.h"
#import  <SDWebImage/UIImageView+WebCache.h>

@interface AdsListCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelUserName;
@property (weak, nonatomic) IBOutlet UIImageView *adsImage;

@end

@implementation AdsListCell

+(CGSize)cellSize {
    return CGSizeMake(200.0, 200.0);
}

-(void)setup:(id)object {
    Ads *ads = (Ads *)object;
    _labelPrice.text = ads.adsPrice;
    _labelUserName.text = ads.adsPerson;

    [_adsImage sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"OLX"]];
    
    [self setupCellCorner];
    [self setupCellShadow];
}

-(void)setupCellCorner {
    
    self.contentView.layer.cornerRadius = 5.0f;
    self.contentView.layer.borderWidth = 1.0f;
    self.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    self.contentView.layer.masksToBounds = YES;
}

-(void)setupCellShadow {
    
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    self.layer.shadowRadius = 2.0f;
    self.layer.shadowOpacity = 1.0f;
    self.layer.masksToBounds = NO;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.contentView.layer.cornerRadius].CGPath;
}

@end
