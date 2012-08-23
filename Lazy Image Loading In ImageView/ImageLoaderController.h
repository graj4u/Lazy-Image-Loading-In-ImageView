//
//  ImageLoaderController.h
//  Lazy Image Loading In ImageView
//
//  Created by Gaurav Raj on 8/22/12.
//
//

#import <Foundation/Foundation.h>


@interface ImageLoaderController : NSObject {
    NSURLConnection * connection;
    NSURL * url;
    NSMutableData * mutData;
    UIImage * image;
    id delegate;
}

@property ( nonatomic, retain ) UIImage * image;

- (id)initWithURL:(NSURL *)aURL;
- (void)setDelegate:(id)anObject;
- (void)load;

@end

@protocol ImageLoaderProtocol

@required
- (void)imageLoader:(ImageLoaderController *)loader
       didLoadImage:(UIImage *)anImage;

@optional
- (void)imageLoader:(ImageLoaderController *)loader
    didReceiveError:(NSError *)anError;

@end

