//
//  UIImageView+UIActivityIndicatorForSDWebImage.m
//  UIActivityIndicator for SDWebImage
//
//  Created by Giacomo Saccardo.
//  Copyright (c) 2013 Giacomo Saccardo. All rights reserved.
//

#import "UIImageView+UIActivityIndicatorForSDWebImage.h"

#define TAG_ACTIVITY_INDICATOR 149462

@interface UIImageView (Private)

-(void)createActivityIndicatorWithSize:(SMActivityIndicatorViewSize) activitySize;
-(void)removeActivityIndicator;

@end


@implementation UIImageView (UIActivityIndicatorForSDWebImage)

-(void) createActivityIndicatorWithSize:(SMActivityIndicatorViewSize) activitySize {
    
    SMActivityIndicatorView *activityIndicator = (SMActivityIndicatorView *)[self viewWithTag:TAG_ACTIVITY_INDICATOR];
    if (activityIndicator == nil) {
        activityIndicator = [[SMActivityIndicatorView alloc] initWithActivityIndicatorSize:activitySize];

        //calculate the correct position
        float width = activityIndicator.frame.size.width;
        float height = activityIndicator.frame.size.height;
        float x = (self.frame.size.width / 2.0) - width/2;
        float y = (self.frame.size.height / 2.0) - height/2;
        activityIndicator.frame = CGRectMake(x, y, width, height);
        
        activityIndicator.hidesWhenStopped = YES;
        activityIndicator.tag = TAG_ACTIVITY_INDICATOR;
        [self addSubview:activityIndicator];
    }
    
    [activityIndicator startAnimating];
    
}

-(void) removeActivityIndicator {
    
    UIView *activityIndicator = [self viewWithTag:TAG_ACTIVITY_INDICATOR];
    if (activityIndicator) {
        [activityIndicator removeFromSuperview];
    }
    
}

#pragma mark - Methods


-(void) setImageWithURL:(NSURL *)url usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activitySize {
    
    [self createActivityIndicatorWithSize:activitySize];

    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:nil
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    [weakSelf removeActivityIndicator];
                }
     ];

}

-(void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activitySize {
    
    [self createActivityIndicatorWithSize:activitySize];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    [weakSelf removeActivityIndicator];
                }
     ];
    
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activitySize{

    [self createActivityIndicatorWithSize:activitySize];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                  options:options
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    [weakSelf removeActivityIndicator];
                }
     ];

}

- (void)setImageWithURL:(NSURL *)url completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activitySize {

    [self createActivityIndicatorWithSize:activitySize];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    completedBlock(image, error, cacheType);
                    [weakSelf removeActivityIndicator];
                }
     ];
    
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activitySize {

    [self createActivityIndicatorWithSize:activitySize];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    completedBlock(image, error, cacheType);
                    [weakSelf removeActivityIndicator];
                }
     ];

}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activitySize {

    [self createActivityIndicatorWithSize:activitySize];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                  options:options
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    completedBlock(image, error, cacheType);
                    [weakSelf removeActivityIndicator];
                }
     ];

}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activitySize {

    [self createActivityIndicatorWithSize:activitySize];
    
    __weak typeof(self) weakSelf = self;
    [self setImageWithURL:url
         placeholderImage:placeholder
                  options:options
                 progress:progressBlock
                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                    completedBlock(image, error, cacheType);
                    [weakSelf removeActivityIndicator];
                }
     ];

}


@end
