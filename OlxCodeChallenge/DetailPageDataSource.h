//
//  DetailPageDataSource.h
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 27/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AdsDetailViewController;

@interface DetailPageDataSource : NSObject <UIPageViewControllerDataSource>

-(NSUInteger)indexOfViewController:(UIViewController *)viewController;

- (AdsDetailViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;

@end
