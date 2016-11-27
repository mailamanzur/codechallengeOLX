//
//  DetailPageViewController.m
//  OlxCodeChallenge
//
//  Created by Maila  Manzur on 27/11/16.
//  Copyright © 2016 Maila  Manzur. All rights reserved.
//

#import "DetailPageViewController.h"
#import "DetailPageDataSource.h"
#import "AdsDetailViewController.h"
#import "AdsModelContainer.h"

@interface DetailPageViewController () <UIPageViewControllerDelegate>
@property(strong, nonatomic)DetailPageDataSource *dataSource;
@property(strong, nonatomic)NSArray *viewControllers;

@end

@implementation DetailPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupPageViewController];
}


-(void)setupPageViewController {
    
    self.pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.viewControllers = @[[self detailViewController]];
    [self.pageViewController setViewControllers:self.viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO  completion:nil];
    
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self.dataSource;
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    self.pageViewController.view.frame = self.view.bounds;
    [self.pageViewController didMoveToParentViewController:self];
    
}

-(DetailPageDataSource *)dataSource {
    if (!_dataSource) {
        _dataSource = [DetailPageDataSource new];
    }
    return _dataSource;
}

-(AdsDetailViewController *)detailViewController {
    
    NSInteger row = [AdsModelContainer sharedManager].indexPath.row;
    
    AdsDetailViewController *details = [self.dataSource viewControllerAtIndex:row storyboard:self.storyboard];
    
    return details;
}


-(UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
    
    UIViewController *currentViewController = self.pageViewController.viewControllers[0];
    NSArray *viewControllers = @[currentViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    self.pageViewController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}
@end
