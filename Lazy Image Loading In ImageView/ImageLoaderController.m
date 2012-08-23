//
//  ImageLoaderController.m
//  Lazy Image Loading In ImageView
//
//  Created by Gaurav Raj on 8/22/12.
//
//

#import "ImageLoaderController.h"

@implementation ImageLoaderController

@synthesize image;

- (void)dealloc
{
    [super dealloc];
    [url release];
    [connection release];
    [mutData release];
    [image release];
}

- (id)initWithURL:(NSURL *)aURL
{
    url = [aURL retain];
    return self;
}

- (void)setDelegate:(id)anObject
{
    delegate = anObject;
}

- (void)load
{
    // SHOW NETWORK INDICATOR
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    // SET UP THE REQUEST
    
    NSURLRequest * request = [[[NSURLRequest alloc] initWithURL:url] autorelease];
    
    // SET UP THE CONNECTION
    
    connection = [[NSURLConnection alloc] initWithRequest:request
                                                 delegate:self];
    
    // NEW MUT DATA
    
    mutData = [[[NSMutableData alloc] init] retain];
    
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    if( [delegate respondsToSelector:@selector(imageLoader:didReceieveError:)] )
    {
        [delegate imageLoader:self
              didReceiveError:error];
    }
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    // APPEND THE DATA
    [mutData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConnection
{
    
    // ONCE LOADED HIDE NETWORK INDICATOR
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    // RELEASE THE CONNECTION
    
    [connection release];
    
    // CREATE NEW UIIMAGE FROM THE DATA
    
    image = [[[UIImage alloc] initWithData:mutData] retain];
    
    
    if( [delegate respondsToSelector:@selector(imageLoader:didLoadImage:)] )
    {
        [delegate imageLoader:self
                 didLoadImage:image];
    }
    
}


@end
