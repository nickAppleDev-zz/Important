//
//  AppConstants.h
//  DataShield
//
//  Created by Softvid Technology.
//  Copyright (c) 2015 Softvid Technology. All rights reserved.
//

#ifndef WERGOLD_AppConstants_h
#define WERGOLD_AppConstants_h

#define GLOBALMETHODS [GlobalMethods sharedInstance]
#define APPDELEGATE [AppDelegate sharedDelegate]

#define OpenFireUserNameKey @"OpenFireUserNameKey"
#define OpenFirePasswordKey @"OpenFirePasswordKey"

#define StatusbarHeight 20.0

#define MAX_LENGTH 4

#define IS_IPHONE ( [[[UIDevice currentDevice] model] isEqualToString:@"iPhone"] )
#define IS_IPOD   ( [[[UIDevice currentDevice ] model] isEqualToString:@"iPod touch"] )
#define IS_HEIGHT_GTE_568 [[UIScreen mainScreen ] bounds].size.height >= 568.0f
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6PLUS ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )736 ) < DBL_EPSILON )
#define IS_IPHONE_6 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? YES : NO)
#define IS_RETINA ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))
#define IS_ThreeDimension ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 3.0))

#define TopBarHeight (IS_IPAD? 120 : 60.0)
#define KeyboardHeight (IS_IPAD? 264 : 216)

#define AppUrl @"https://itunes.apple.com/us/app/data-shield/id1060013396?ls=1&mt=8"

//Font Name
#define DBName @"userdb.sql"

//Font Name
#define FontRobotoBold @"Roboto-Bold"
#define FontRobotoRegular @"Roboto-Regular"
#define FontRobotoItalic @"Roboto-Italic"

//Change Interenet Connection
#define ChangeInternetConnectionNotification @"ChangeInternetConnectionNotification"

#endif
