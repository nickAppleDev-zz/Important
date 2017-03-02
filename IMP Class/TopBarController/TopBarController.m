//
//  TopBarController.m
//  WERGOLD
//
//  Created by Softvid Technology.
//  Copyright (c) 2015 Softvid Technology. All rights reserved.
//

#import "TopBarController.h"

@import GoogleMobileAds;

static int const SpinnerTag = 5676;

@interface TopBarController ()

@end

@implementation TopBarController
@synthesize bannerView = _bannerView;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Create Topbar
    [self createTopbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark - Create TopBar

-(void)createTopbar
{
    NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);

    // ===== Ad's Setup =====
    self.bannerView = [[GADBannerView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-TopBarHeight, [UIScreen mainScreen].bounds.size.width, TopBarHeight)];
    self.bannerView.adUnitID = @"ca-app-pub-7818386037982253/6311095525";
    self.bannerView.rootViewController = self;
    [self.bannerView loadRequest:[GADRequest request]];
    [self.view addSubview:self.bannerView];
    
    //TopbarView
    viewMainTopbar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, TopBarHeight)];
    [viewMainTopbar setBackgroundColor:[UIColor colorWithRed:(226.f/255.f) green:(162.f/255.f) blue:(51.f/255.f) alpha:1.0]];
    [viewMainTopbar setTag:TopBarViewTag];
    [self.view addSubview:viewMainTopbar];
    
    // Set Background color
    [self.view setBackgroundColor:[UIColor colorWithRed:(238.f/255.f) green:(238.f/255.f) blue:(238.f/255.f) alpha:1.0]];
    
    //View Title
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, StatusbarHeight, [UIScreen mainScreen].bounds.size.width, TopBarHeight - StatusbarHeight)];
    [viewMainTopbar addSubview:lblTitle];
    [lblTitle setTag:TopBarTitleTag];
    [lblTitle setTextColor:[UIColor whiteColor]];
    [lblTitle setFont:[UIFont boldSystemFontOfSize:[UIScreen mainScreen].bounds.size.width/10-10]];
    [lblTitle setBackgroundColor:[UIColor clearColor]];
    [lblTitle setTextAlignment:NSTextAlignmentCenter];
    
    //Back button
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBack setBackgroundImage:[UIImage imageNamed:@"Back.png"] forState:UIControlStateNormal];
    [viewMainTopbar addSubview:btnBack];
    if (IS_IPAD)
    {
        [btnBack setFrame:CGRectMake(0, 40, 70, 65)];
    }
    else
    {
        [btnBack setFrame:CGRectMake(0, 30, 30, 25)];
    }
    [btnBack setTag:TopbarBackButtonTag];
    [btnBack addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark
#pragma mark - Set Title Text

-(void)setTitleText:(NSString *)strTitle
{
    UIView *viewTopbar = [self.view viewWithTag:TopBarViewTag];
    
    UILabel *lblTitle = (UILabel *)[viewTopbar viewWithTag:TopBarTitleTag];
    
    [lblTitle setFont:[UIFont fontWithName:@"Baskerville-Bold" size:IS_IPAD? 50: 25]];
    
    [lblTitle setTextAlignment:NSTextAlignmentCenter];
    
    [lblTitle setText:strTitle];
}

-(void)setTitleText:(NSString *)strTitle withFrame:(CGRect)newFrame
{
    UIView *viewTopbar = [self.view viewWithTag:TopBarViewTag];
    
    UILabel *lblTitle = (UILabel *)[viewTopbar viewWithTag:TopBarTitleTag];
    
    [lblTitle setText:strTitle];
    
    [lblTitle setFrame:newFrame];
}

#pragma mark
#pragma mark -  Status Bar Style Method

- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark
#pragma mark - Hide Topbar

-(void)hideTopbar
{
    UIView *viewTopbar = [self.view viewWithTag:TopBarViewTag];
    viewTopbar.hidden = YES;
}

#pragma mark
#pragma mark - Hide and Show Back button

-(void)hideBackButton:(BOOL)hide
{
    UIView *viewTopbar = [self.view viewWithTag:TopBarViewTag];
    
    UIButton *btnBack = (UIButton *)[viewTopbar viewWithTag:TopbarBackButtonTag];
    
    [btnBack setHidden:hide];
}

#pragma mark
#pragma mark - Back Button Action Methods

-(void)backButtonPressed:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
