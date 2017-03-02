//
//  GlobalMethods.h
//  DataShield
//
//  Created by Softvid Technology.
//  Copyright (c) 2015 Softvid Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "SVProgressHUD.h"

@interface GlobalMethods : NSObject <UITextViewDelegate>

@property (nonatomic) int internetTag;

//Class Methods
+ (GlobalMethods *)sharedInstance;

//Show Alert
-(void)showAlertWithTitle:(NSString *)strTitle andMessage:(NSString *)strMsg;

//Create Request
-(NSMutableURLRequest *)createRequestWithURL:(NSString *)strURL andParameters:(NSMutableDictionary *)dicParams;

//String Encodeing decoding methods

-(NSString *)encodeString:(NSString *)str;
-(NSString *)decodeString:(NSString *)str;

//Get XIB Post Fix
-(NSString *)getXIBPostFix;

-(BOOL)isValidEmailAddress:(NSString *)checkString;

@end