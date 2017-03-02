//
//  GlobalMethods.m
//  DataShield
//
//  Created by Softvid Technology.
//  Copyright (c) 2015 Softvid Technology. All rights reserved.
//

#import "GlobalMethods.h"

@implementation GlobalMethods


static GlobalMethods *sharedInstance;


- (id)init
{
    self = [super init];
    if (self)
    {
        //Custom Intialization
    }
    
    return self;
}

+ (GlobalMethods *)sharedInstance
{
    @synchronized(self)
    {
        if (sharedInstance == NULL)
        {
            sharedInstance = [[GlobalMethods alloc] init];
        }
        return sharedInstance;
    }
}


#pragma mark
#pragma mark - Show Alert Message
-(void)showAlertWithTitle:(NSString *)strTitle andMessage:(NSString *)strMsg
{
    [[[UIAlertView alloc]initWithTitle:strTitle message:strMsg delegate:nil cancelButtonTitle:NSLocalizedString(@"alertButtonOK", nil) otherButtonTitles:nil, nil]show];
}

#pragma mark
#pragma mark - Create Request Methods

-(NSMutableURLRequest *)createRequestWithURL:(NSString *)strURL andParameters:(NSMutableDictionary *)dicParams
{
    //Request Create
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:strURL]];
    
    //Content Type
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];

    //Create Body
    NSMutableData *body = [[NSMutableData alloc] init];
    
    for (int i = 0; i < [dicParams allKeys].count; i++)
    {
        [self setName:[[dicParams allKeys] objectAtIndex:i] withValue:[dicParams objectForKey:[[dicParams allKeys] objectAtIndex:i]] onBody:body];
    }
    
    //Set Body parameters
    [request setHTTPBody:body];
    [request setHTTPMethod:@"POST"];
    
    return request;
}

#pragma mark
#pragma mark - Set Parameter Methods

-(void)setName:(NSString *)name withValue:(NSString *)value onBody:(NSMutableData *)body
{
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",name] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[value dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
}

-(void)setName:(NSString *)name withFileName:(NSString *)fileName withValue:(NSData *)data onBody:(NSMutableData *)body{
    NSString *boundary = @"---------------------------14737809831466499882746641449";
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: attachment; name=\"%@\"; filename=\"%@\"\r\n",name, fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:data];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
}

#pragma mark
#pragma mark - Base 64 Encode and Decode

-(NSString *)encodeString:(NSString *)str
{
    return [[str dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
}

-(NSString *)decodeString:(NSString *)str
{
    return [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:str options:0] encoding:NSUTF8StringEncoding];
}

-(NSString *)getXIBPostFix
{
    if (IS_IPAD)
    {
        return @"_iPad";
    }
    else
    {
        if (IS_IPHONE_5)
        {
            return @"_iPhone";
        }
        if (IS_IPHONE_6)
        {
            return @"_iPhone";

//            return @"_iPhone6";
        }
        else if (IS_IPHONE_6PLUS)
        {
            return @"_iPhone";

//            return @"_iPhone6_Plus";
        }
        else
        {
            return @"_iPhone";

//            return @"_iPhone";
        }
    }
}

#pragma mark
#pragma mark - Email Validation

-(BOOL)isValidEmailAddress:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

@end
