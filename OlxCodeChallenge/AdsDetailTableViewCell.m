//
//  AdsDetailTableViewCell.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 27/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "AdsDetailTableViewCell.h"
#import "Ads.h"

@interface AdsDetailTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation AdsDetailTableViewCell

-(void)setup:(id)object {
    Ads *ads = (Ads *)object;
    _titleLabel.text = ads.adsTitle;
    _dateLabel.text = ads.adsDate;
    _priceLabel.text = [NSString stringWithFormat:@"€ %@", ads.adsPrice];
    _descriptionLabel.text = ads.adsDescription;
    
}

+(CGFloat)cellHeight {
    return UITableViewAutomaticDimension;
}


@end
