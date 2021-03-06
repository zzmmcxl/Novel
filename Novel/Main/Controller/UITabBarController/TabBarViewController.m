//
//  TabBarViewController.m
//  Novel
//
//  Created by John on 16/3/23.
//  Copyright © 2016年 John. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavigationController.h"
#import "BookShelfViewController.h"
#import "MainViewController.h"
#import "BookListViewController.h"
#import "SearchViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpAllChildViewController];
}
- (void)setUpAllChildViewController
{
    //书架
    BookShelfViewController *bookShelf = [[BookShelfViewController alloc] init];
    [self setUpOneChildController:bookShelf image:[UIImage imageNamed:@"TabBar1"] selImage:[UIImage imageNamed:@"TabBar1Sel"] title:@"书架"];
    
    //书城
    MainViewController *main = [[MainViewController alloc] init];
    [self setUpOneChildController:main image:[UIImage imageNamed:@"TabBar2"] selImage:[UIImage imageNamed:@"TabBar2Sel"] title:@"书城"];
    //书单
    BookListViewController *bookList = [[BookListViewController alloc] init];
    [self setUpOneChildController:bookList image:[UIImage imageNamed:@"TabBar3"] selImage:[UIImage imageNamed:@"TabBar3Sel"] title:@"书单"];
    //搜书
    SearchViewController *search = [[SearchViewController alloc]init];
    [self setUpOneChildController:search image:[UIImage imageNamed:@"TabBar4"] selImage:[UIImage imageNamed:@"TabBar4Sel"] title:@"搜书"];
}
//
- (void)setUpOneChildController:(UIViewController *)viewController image:(UIImage *)iamge selImage:(UIImage *)selImage title:(NSString *)title
{
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:viewController];
    
    nav.title = title;
    
    //设置高亮
    // 默认情况下，tabbar会选中的图片进行渲染成蓝色
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    nav.tabBarItem.selectedImage = selImage;
    
    viewController.navigationItem.title = title;
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName: [UIColor colorWithRed:243/255.0 green:0/255.0 blue:0/255.0 alpha:1],
                          
                          };
    [nav.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
    
    nav.tabBarItem.image = iamge;
    
    [self addChildViewController:nav];
}
//另外一种方法
/*
- (void)setUpAllChildViewController
{
    //书架
    BookShelfViewController *bookShelf = [[BookShelfViewController alloc] init];
    [self setUpNavigationWithController:bookShelf image:[UIImage imageNamed:@"TabBar1"] selImage:[UIImage imageNamed:@"TabBar1Sel"] title:@"书架"];
    
    //书城
    MainViewController *main = [[MainViewController alloc] init];
    [self setUpNavigationWithController:main image:[UIImage imageNamed:@"TabBar2"] selImage:[UIImage imageNamed:@"TabBar2Sel"] title:@"书城"];
    //书单
    BookListViewController *bookList = [[BookListViewController alloc] init];
    [self setUpNavigationWithController:bookList image:[UIImage imageNamed:@"TabBar3"] selImage:[UIImage imageNamed:@"TabBar3Sel"] title:@"书单"];
    //搜书
    SearchViewController *search = [[SearchViewController alloc]init];
    [self setUpNavigationWithController:search image:[UIImage imageNamed:@"TabBar4"] selImage:[UIImage imageNamed:@"TabBar4Sel"] title:@"搜书"];
    
    
    self.viewControllers = @[bookShelf,main,bookList,search];
    self.selectedIndex = 0;
}
//设置tabbar标题和图片
-(void)setUpNavigationWithController:(UIViewController*)controller image:(UIImage*)image selImage:(UIImage *)selImage title:(NSString*)title
{
    controller.title = title;
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = image;
    //设置高亮
    // 默认情况下，tabbar会选中的图片进行渲染成蓝色
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = selImage;
    
    NSDictionary *dic = @{
                          NSForegroundColorAttributeName: [UIColor colorWithRed:243/255.0 green:0/255.0 blue:0/255.0 alpha:1],
                          
                          };
    [controller.tabBarItem setTitleTextAttributes:dic forState:UIControlStateSelected];
}
 */


@end
