//
//  CustomURLConnection.h

//  Created by Softvid Technology.
//  Copyright (c) 2015 Softvid Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomURLConnectionDelegate;

@interface CustomURLConnection : NSObject <NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    //Delegate
    id _delegate;
    
    //Connection Object
    NSURLConnection *conObj;
    
    //Data;
    NSMutableData *dataReceived;
}

//Properties
@property (nonatomic) int tag;
@property (strong,nonatomic) id delegate;

//Init Methods
-(id)initWithRequest:(NSMutableURLRequest *)request withTag:(int)cTag;

//Start Connection Method
-(void)startConnection;

//Stop Connection Method
-(void)stopConnection;
@end


@protocol CustomURLConnectionDelegate <NSObject>

@optional

//Delegate Methods

//For Error
- (void)customURLConnection:(CustomURLConnection *)connection withTag:(int)tagCon didFailWithError:(NSError *)error;

//For Exception
- (void)customURLConnection:(CustomURLConnection *)connection withException:(NSException *)exception withTag:(int)tagCon;

//For Getting Response
- (void)customURLConnection:(CustomURLConnection *)connection withTag:(int)tagCon didReceiveResponse:(NSURLResponse *)response;

//For Receive Partial Data
- (void)customURLConnection:(CustomURLConnection *)connection withTag:(int)tagCon didReceiveData:(NSData *)data;

//For Getting the complete Response
- (void)customURLConnectionDidFinishLoading:(CustomURLConnection *)connection withTag:(int)tagCon;

//For Complete Response with Result
- (void)customURLConnectionDidFinishLoading:(CustomURLConnection *)connection withTag:(int)tagCon withResponse:(id)response;

//For Complete Result in data
- (void)customURLConnectionDidFinishLoading:(CustomURLConnection *)connection withTag:(int)tagCon withData:(NSMutableData *)data;

//For Complete Result in data
- (void)customURLConnectionDidFinishLoading:(CustomURLConnection *)connection withTag:(int)tagCon withData:(NSMutableData *)data FromURL:(NSURL *)url;

@end
