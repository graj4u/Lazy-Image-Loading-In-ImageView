//
//  GRViewController.h
//  Lazy Image Loading In ImageView
//
//  Created by Gaurav Raj on 8/23/12.
//  Copyright (c) 2012 Gaurav Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageLoaderController.h"

@interface GRViewController : UIViewController <ImageLoaderProtocol>

@property (retain, nonatomic) IBOutlet UIImageView *myImageView;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *myActivityIndicator;

@end
