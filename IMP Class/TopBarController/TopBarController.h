//
//  TopBarController.h
//  WERGOLD
//
//  Created by Softvid Technology.
//  Copyright (c) 2015 Softvid Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppConstants.h"
#import "CustomURLConnection.h"
#import "MGSwipeTableCell.h"
#import "SSSearchBar.h"

@class GADBannerView;

enum TopBarVCTags
{
    TopBarViewTag = 101,
    TopBarTitleTag,
    TopbarBackButtonTag
};

@interface TopBarController : UIViewController<CustomURLConnectionDelegate, MGSwipeTableCellDelegate, SSSearchBarDelegate>
{
    UIView *viewMainTopbar;
}

@property (strong, nonatomic) IBOutlet GADBannerView  *bannerView;

//Local Helper Methods
-(void)setTitleText:(NSString *)strTitle;
-(void)setTitleText:(NSString *)strTitle withFrame:(CGRect)newFrame;

//Hide Back Button
-(void)hideBackButton:(BOOL)hide;

-(void)backButtonPressed:(UIButton *)btn;

-(void)hideTopbar;

-(void)startActivityIndicatorWithText:(NSString *)strText;

- (NSManagedObjectContext *)managedObjectContext;

@end
