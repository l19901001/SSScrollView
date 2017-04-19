//
//  SSHomeHeaderView.h
//  ZAKER_APP
//
//  Created by lss on 16/4/25.
//  Copyright © 2016年 lss. All rights reserved.
//
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HeaderViewDragDirection)//滚动样式
{
    /**
     *  水平方向
     */
    HeaderViewDragDirectionHorizontal = 1,
    /**
     *  垂直方向
     */
    HeaderViewDragDirectionVertical
};
typedef NS_ENUM(NSInteger, HeaderViewContentStyle)//轮播容器样式
{
    /**
     *  图片轮播
     */
    HeaderViewScrollViewImageViewStyle = 1,
    /**
     *  文字消息轮播
     */
    HeaderViewScrollViewLableStyle
};

@interface SSScrollView :UIView
/**
 *  滚动样式
 */
@property (nonatomic, assign) HeaderViewDragDirection dragDirection;
/**
 *  轮播容器样式
 */
@property (nonatomic, assign) HeaderViewContentStyle contentStyle;
/**
 *  滚动计时 默认为 1.0
 */
@property (nonatomic, assign) NSTimeInterval rollingTime;



/**
 *  初始化HeaderView
 *
 *  @param frame                      frame
 *  @param images                     滚动方向
 *
 *  @return HeaderView
 */
-(instancetype)initWithFrame:(CGRect)frame DragDirection:(HeaderViewDragDirection)dragDirection;
/**
 *  获取并设置轮播容器的对应数据
 */
-(void)reloadheaderViewWithDatas:(NSArray *)datas;



@end
