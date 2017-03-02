//
//  CustomURLConnection.m

//  Created by Softvid Technology.
//  Copyright (c) 2015 Softvid Technology. All rights reserved.
//
#import "CustomURLConnection.h"

@implementation CustomURLConnection
{
    
}
@synthesize tag = _tag;

#pragma mark
#pragma mark - Init Request Method

-(id)initWithRequest:(NSMutableURLRequest *)request withTag:(int)cTag
{
    self = [super init];
    
    if (self)
    {
        //Create Connection
        conObj = [[NSURLConnection alloc]initWithRequest:request delegate:self];
        
        //Setup a tag
        self.tag = cTag;
    }
    
    return self;
}

#pragma mark
#pragma mark - Start the connection

-(void)startConnection
{
    //Start
    [conObj start];
}

-(void)stopConnection
{
    //Stop
    [conObj cancel];
}


#pragma mark
#pragma mark - NSURLConnectionData Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //when Response received
    dataReceived = [[NSMutableData alloc]init];
    
    //Call Delegate Method
    if ([self.delegate respondsToSelector:@selector(customURLConnection:withTag:didReceiveResponse:)])
    {
        [self.delegate customURLConnection:self withTag:self.tag didReceiveResponse:response];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //When Partial Data Arrived
    [dataReceived appendData:data];
    
    //Call Delegate Method
    if ([self.delegate respondsToSelector:@selector(customURLConnection:withTag:didReceiveData:)])
    {
        [self.delegate customURLConnection:self withTag:self.tag didReceiveData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //When Complete Data Received
    
    //Parse Into Json
    NSError *error;
    
    @try
    {
        //Parsed Response
        id receivedData = [NSJSONSerialization JSONObjectWithData:dataReceived options:NSJSONReadingMutableContainers error:&error];
        
        if ([self.delegate respondsToSelector:@selector(customURLConnectionDidFinishLoading:withTag:)])
        {
            [self.delegate customURLConnectionDidFinishLoading:self withTag:self.tag];
        }
        
        if ([self.delegate respondsToSelector:@selector(customURLConnectionDidFinishLoading:withTag:withData:)])
        {
            [self.delegate customURLConnectionDidFinishLoading:self withTag:self.tag withData:dataReceived];
        }
        
        if ([self.delegate respondsToSelector:@selector(customURLConnectionDidFinishLoading:withTag:withResponse:)])
        {
            [self.delegate customURLConnectionDidFinishLoading:self withTag:self.tag withResponse:receivedData];
        }
        
        if ([self.delegate respondsToSelector:@selector(customURLConnectionDidFinishLoading:withTag:withData:FromURL:)])
        {
            [self.delegate customURLConnectionDidFinishLoading:self withTag:self.tag withData:dataReceived FromURL:conObj.currentRequest.URL];
        }
    }
    @catch (NSException *exception)
    {
        if ([self.delegate respondsToSelector:@selector(customURLConnection:withException:withTag:)])
        {
            [self.delegate customURLConnection:self withException:exception withTag:self.tag];
        }
    }
    @finally
    {
        
    }
}

#pragma mark
#pragma mark - NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //Call Delegate Method
    if ([self.delegate respondsToSelector:@selector(customURLConnection:withTag:didFailWithError:)])
    {
        [self.delegate customURLConnection:self withTag:self.tag didFailWithError:error];
    }
}

#pragma mark
#pragma mark - Dealloc

-(void)dealloc
{
    //Nil Data
    dataReceived = nil;
    
    //Nil the connection
    conObj = nil;
    
    id __weak tempDelegate = self.delegate;
    self.delegate = nil;
    tempDelegate = nil;
}

@end
