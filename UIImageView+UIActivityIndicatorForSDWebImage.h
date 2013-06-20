//
//  UIImageView+UIActivityIndicatorForSDWebImage.h
//  UIActivityIndicator for SDWebImage
//
//  Created by Giacomo Saccardo.
//  Copyright (c) 2013 Giacomo Saccardo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#import "SMActivityIndicatorView.h"

@interface UIImageView (UIActivityIndicatorForSDWebImage)

- (void)setImageWithURL:(NSURL *)url usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activityStyle;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activityStyle;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activityStyle;
- (void)setImageWithURL:(NSURL *)url completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activityStyle;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activityStyle;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activityStyle;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletedBlock)completedBlock usingActivityIndicatorSize:(SMActivityIndicatorViewSize)activityStyle;

@end
