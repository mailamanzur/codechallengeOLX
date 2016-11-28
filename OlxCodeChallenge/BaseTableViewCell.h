//
//  BaseTableViewCell.h
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 27/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

+(CGFloat)cellHeightWithPadding:(CGFloat)padding;
+(CGFloat)cellHeight;
+(NSString *)cellIdentifier;
-(void)setup:(id)object;
+(void)registerForTableView:(UITableView*)tableview;

@end
