//
//  DetailPageDataSource.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 27/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "DetailPageDataSource.h"
#import "AdsDetailViewController.h"
#import "AdsModelContainer.h"

@interface DetailPageDataSource ()

@property(strong, nonatomic) NSArray *pageData;

@end

@implementation DetailPageDataSource


-(instancetype)init {
    self = [super init];
    if (self) {
        _pageData = [AdsModelContainer sharedManager].adsList;
    }
    return self;
}

- (AdsDetailViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }
    
    AdsDetailViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"AdsDetailViewController"];
    dataViewController.ads = self.pageData[index];
    return dataViewController;
}

-(NSUInteger)indexOfViewController:(AdsDetailViewController *)viewController {
    
    
    return [self.pageData indexOfObject:viewController.ads];
    
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(AdsDetailViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(AdsDetailViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
