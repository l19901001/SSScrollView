//
//  SSCustomView.m
//  ZAKER_APP
//
//  Created by lss on 16/4/21.
//  Copyright © 2016年 lss. All rights reserved.
//

#import "SSCustomView.h"
#import "SSCustomColors.h"

@implementation SSCustomView

+(UIButton *)customButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.backgroundColor = [UIColor whiteColor];
    button.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    return button;
}

+(UIButton *)customButtonWithCornerRadius:(CGFloat)cornerRadius
{
    UIButton *button = [self customButton];
    button.clipsToBounds = YES;
    button.layer.cornerRadius = cornerRadius;
    
    return button;
}

+(UIButton *)customButtonWithTitle:(NSString *)butTitle titleSize:(CGFloat)titleSize
{
    UIButton *button = [self customButton];
    [button setTitle:butTitle forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    
    return button;
}

+(UIButton *)customButtonWithTitle:(NSString *)butTitle titleSize:(CGFloat)titleSize butImage:(NSString *)imageName
{
    UIButton *button = [self customButtonWithTitle:butTitle titleSize:titleSize];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    return button;
}

+(UILabel *)customLable
{
    UILabel *lable = [[UILabel alloc] init];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.backgroundColor = [UIColor whiteColor];
    lable.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    return lable;
}

+(UILabel *)customLableWithCornerRedius:(CGFloat)cornerRedius
{
    UILabel *lable = [self customLable];
    lable.clipsToBounds = YES;
    lable.layer.cornerRadius = cornerRedius;
    
    return lable;
}

+(UILabel *)customLableWithTitleClolor:(UIColor *)titleColor titleSize:(CGFloat)titleSize
{
    UILabel *lable = [self customLable];
    lable.textColor = titleColor;
    lable.font = [UIFont systemFontOfSize:titleSize];
    
    return lable;
}

+(UIImageView *)customImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    return imageView;
}

+(UIImageView *)customImageViewWithCornerRedius:(CGFloat)cornerRedius
{
    UIImageView *imageView = [self customImageView];
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = cornerRedius;
    
    return imageView;
}

+(UIScrollView *)customScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    
    return scrollView;
}

+(UIPageControl *)customPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.pageIndicatorTintColor = [SSCustomColors sharedAppraance].defualtStateColor;
    pageControl.currentPageIndicatorTintColor = [SSCustomColors sharedAppraance].highlightStateColor;
    pageControl.currentPage = 0;
    
    return pageControl;
}



@end
