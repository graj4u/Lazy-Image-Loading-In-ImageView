//
//  GRViewController.m
//  Lazy Image Loading In ImageView
//
//  Created by Gaurav Raj on 8/23/12.
//  Copyright (c) 2012 Gaurav Raj. All rights reserved.
//

#import "GRViewController.h"


@interface GRViewController ()

@end

@implementation GRViewController
@synthesize myImageView;
@synthesize myActivityIndicator;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    ImageLoaderController * imageLoader = [[[ImageLoaderController alloc] initWithURL:[NSURL URLWithString:@"https://dl.dropbox.com/u/48980236/image1.jpg"]] retain];
    [imageLoader setDelegate:self];
    [imageLoader load];
    [self.myActivityIndicator startAnimating];
}



- (void)viewDidUnload
{
    [self setMyImageView:nil];
    [self setMyActivityIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}



- (void)imageLoader:(ImageLoaderController *)imageLoader didReceieveError:(NSError *)anError {
    
    NSLog(@"Image Loader did Receieve Error...");
    [self.myActivityIndicator stopAnimating];
}

- (void)imageLoader:(ImageLoaderController *)imageLoader didLoadImage:(UIImage *)anImage {
    
    NSLog(@"Image Loader did Load Image... ");
    
    myImageView.image = anImage;
    [self.myActivityIndicator stopAnimating];
	[imageLoader release];
}


- (void)dealloc {
    [myImageView release];
    [myActivityIndicator release];
    [super dealloc];
}
@end
