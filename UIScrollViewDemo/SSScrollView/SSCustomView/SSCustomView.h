//
//  SSCustomView.h
//  ZAKER_APP
//
//  Created by lss on 16/4/21.
//  Copyright © 2016年 lss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSCustomView : NSObject
/**
 *  定制按钮
 *
 *  @return 返回 UIButton
 */
+(UIButton *)customButton;
/**
 *  定制带文字的按钮 同时约束文字大小
 *
 *  @param butTitle  按钮文字
 *  @param titleSize 按钮文字带下
 *
 *  @return 返回 UIButton
 */
+(UIButton *)customButtonWithTitle:(NSString *)butTitle titleSize:(CGFloat)titleSize;
/**
 *  定制带圆角的按钮
 *
 *  @param cornerRadius 圆角度数
 *
 *  @return 返回 UIButton
 */
+(UIButton *)customButtonWithCornerRadius:(CGFloat)cornerRadius;
/**
 *  定制带文字与背景图片的按钮 同时设置文字大小
 *
 *  @param butTitle  按钮文字
 *  @param titleSize 按钮文字大小
 *  @param imageName 按钮背景图片
 *
 *  @return 返回 UIButton
 */
+(UIButton *)customButtonWithTitle:(NSString *)butTitle titleSize:(CGFloat)titleSize
                                                        butImage:(NSString *)imageName;
/**
 *  定制 UILable
 *
 *  @return 返回 UILable
 */
+(UILabel *)customLable;
/**
 *  定制带圆角的lable
 *
 *  @param cornerRedius 圆角度数
 *
 *  @return 返回带圆角的lable
 */
+(UILabel *)customLableWithCornerRedius:(CGFloat)cornerRedius;
/**
 *  定制 UILable
 *
 *  @param titleColor lable字体颜色
 *  @param titleSize  lable字体大小
 *
 *  @return 返回 UILable
 */
+(UILabel *)customLableWithTitleClolor:(UIColor *)titleColor titleSize:(CGFloat)titleSize;
/**
 *  定制 UIImageView
 *
 *  @return 返回 UIImageView
 */
+(UIImageView *)customImageView;
/**
 *  定制带圆角的 UIImageView
 *
 *  @param cornerRedius 圆角度数
 *
 *  @return 返回 UIImageView
 */
+(UIImageView *)customImageViewWithCornerRedius:(CGFloat)cornerRedius;
/**
 *  定制UIScrollView
 *  默认水平和垂直滚动条为 NO
 *  @return UIScrollView
 */
+(UIScrollView *)customScrollView;
/**
 *  定制UIPageControl
 *  默认色为灰色
 *  选中色为橘色
 *  默认选中为 0
 *  @return UIPageControl
 */
+(UIPageControl *)customPageControl;


@end
