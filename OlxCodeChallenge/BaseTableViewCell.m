//
//  BaseTableViewCell.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 27/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+(CGFloat)cellHeightWithPadding:(CGFloat)padding{
    return [self cellHeight] + padding;
}

+(CGFloat)cellHeight{
    return 0;
}

+(NSString *)cellIdentifier{
    NSString *identifier = NSStringFromClass(self.class);
    return identifier;
}

-(void)setup:(id)object{
    
}

+(void)registerForTableView:(UITableView*)tableview{
    NSString *identifier = NSStringFromClass(self.class);
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [tableview registerNib:nib forCellReuseIdentifier:[self cellIdentifier]];
}

@end
