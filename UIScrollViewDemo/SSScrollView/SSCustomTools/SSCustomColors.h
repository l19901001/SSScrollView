//
//  SSCustomTools.h
//  ZAKER_APP
//
//  Created by lss on 16/4/26.
//  Copyright © 2016年 lss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSCustomColors : NSObject
+(instancetype)sharedAppraance;

/**
 *  分割线颜色
 */
@property (nonatomic, strong) UIColor *separateLineColor;
/**
 *  普通标示颜色
 */
@property (nonatomic, strong) UIColor *defualtStateColor;
/**
 *  高亮状态颜色
 */
@property (nonatomic, strong) UIColor *highlightStateColor;
@end
