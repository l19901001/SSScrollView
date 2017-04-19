//
//  SSHomeHeaderView.m
//  ZAKER_APP
//
//  Created by lss on 16/4/25.
//  Copyright © 2016年 lss. All rights reserved.
//

#define IMAGEVIEW_TAG 1000
#define BUTTON_TAG 2000

#import "SSScrollView.h"
#import "SSCustomView.h"

@interface SSScrollView () <UIScrollViewDelegate>
/**
 *  当前图片编号
 */
@property (nonatomic, assign) NSInteger currenIndex;
/**
 *  轮播器
 */
@property (nonatomic, strong) UIScrollView *customScrollView;
/**
 *  pageContorl
 */
@property (nonatomic, strong) UIPageControl *customPageControl;
/**
 *  图片数据
 */
@property (nonatomic, strong) NSArray *datasArray;
/**
 *  是否在滚动
 */
@property (nonatomic, assign) BOOL enableRolling;


@end

@implementation SSScrollView
@synthesize currenIndex;
@synthesize customScrollView;
@synthesize customPageControl;
@synthesize datasArray;
@synthesize rollingTime;
@synthesize enableRolling;

-(instancetype)initWithFrame:(CGRect)frame DragDirection:(HeaderViewDragDirection)dragDirection
{
    self = [super initWithFrame:frame];
    if(self){
        rollingTime = 1.0;
        currenIndex = 1;
        _dragDirection = dragDirection;
        [self addSubview:self.customScrollView];
        [self addSubview:self.customPageControl];
    }
    
    return self;
}
/**
 *  初始化UIScrollView
 */
-(UIScrollView *)customScrollView
{
    if(!customScrollView){
        customScrollView = [SSCustomView customScrollView];
        customScrollView.frame = self.bounds;
        customScrollView.delegate = self;
    }
    
    return customScrollView;
}
/**
 *  初始化UIPageControl
 */
-(UIPageControl *)customPageControl
{
    if (!customPageControl) {
        customPageControl = [SSCustomView customPageControl];
        customPageControl.frame = CGRectMake(0, self.bounds.size.height-20, self.bounds.size.width, 20);
    }
    
    return customPageControl;
}
/**
 *  定制UIScrollView中的UIImageView并设置UIScrollView的conten数据
 */
-(void)setContentStyle:(HeaderViewContentStyle)contentStyle
{
    _contentStyle = contentStyle;
    
    [self customScrollViewWithImageViewNum:3];
}
-(void)customScrollViewWithImageViewNum:(NSInteger)num
{
    for(int i = 0; i < num; i++){
        if(_contentStyle == HeaderViewScrollViewImageViewStyle){
            UIImageView *imageView = [SSCustomView customImageView];
            imageView.contentMode = UIViewContentModeScaleToFill;
            imageView.userInteractionEnabled = YES;
            imageView.frame = customScrollView.bounds;
            imageView.tag = IMAGEVIEW_TAG+i;
            
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewWithHanld:)];
            [imageView addGestureRecognizer:tapGesture];
            
            if(_dragDirection == HeaderViewDragDirectionHorizontal){
                imageView.frame = CGRectOffset(imageView.frame, i*customScrollView.bounds.size.width, 0);
            }
            if(_dragDirection == HeaderViewDragDirectionVertical){
                imageView.frame = CGRectOffset(imageView.frame, 0, i*customScrollView.bounds.size.height);
            }

            [customScrollView addSubview:imageView];
        }
        
        if(_contentStyle == HeaderViewScrollViewLableStyle){
            UIButton *button = [SSCustomView customButton];
            button.frame = customScrollView.bounds;
            button.tag = BUTTON_TAG+i;
            
            if(_dragDirection == HeaderViewDragDirectionHorizontal){
                button.frame = CGRectOffset(button.frame, i*customScrollView.bounds.size.width, 0);
            }
            if(_dragDirection == HeaderViewDragDirectionVertical){
                button.frame = CGRectOffset(button.frame, 0, i*customScrollView.bounds.size.height);
            }
            
            [customScrollView addSubview:button];
        }
    }
    
    if(_dragDirection == HeaderViewDragDirectionHorizontal){
        customScrollView.contentSize = CGSizeMake(customScrollView.bounds.size.width*3, 0);
    }
    
    if(_dragDirection == HeaderViewDragDirectionVertical){
        customScrollView.contentSize = CGSizeMake(0, customScrollView.bounds.size.height*3);
    }
}
/**
 *  获取数据和设置数据
 */
-(void)reloadheaderViewWithDatas:(NSArray *)datas
{
    datasArray = datas;
    customPageControl.numberOfPages = datasArray.count;
    
    [self startDownDataWithImage];
}
/**
 *  处理资源数据
 */
-(void)startDownDataWithImage
{
    [self refreshDataWithImage];
    enableRolling = YES;
    [self performSelector:@selector(rollingScrollView) withObject:nil afterDelay:rollingTime];
}
/**
 *  刷新数据
 */
-(void)refreshDataWithImage
{
    NSArray *storArray = [self storImageArrayWithindex:currenIndex];
    
    for(int i = 0; i < storArray.count; i++){
        if(_contentStyle == HeaderViewScrollViewImageViewStyle){
            UIImageView *imageView = (UIImageView *)[customScrollView viewWithTag:IMAGEVIEW_TAG+i];
//            _headerViewModel = [storArray objectAtIndex:i];
//            [imageView sd_setImageWithURL:[NSURL URLWithString:_headerViewModel.imgUrl] placeholderImage:nil];
            NSString *imageName = [storArray objectAtIndex:i];
            imageView.image = [UIImage imageNamed:imageName];
        }
        if(_contentStyle == HeaderViewScrollViewLableStyle){
            UIButton *button = (UIButton *)[customScrollView viewWithTag:BUTTON_TAG+i];
            [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            NSString *title = [storArray objectAtIndex:i];
            [button setTitle:title forState:UIControlStateNormal];
        }
    }
    
    if(_dragDirection == HeaderViewDragDirectionHorizontal){
        customScrollView.contentOffset = CGPointMake(customScrollView.bounds.size.width, 0);
        
    }else if(_dragDirection == HeaderViewDragDirectionVertical){
        customScrollView.contentOffset = CGPointMake(0, customScrollView.bounds.size.height);
    }
   
    customPageControl.currentPage = currenIndex-1;
}
/**
 *  重新排序数据集合
 */
-(NSArray *)storImageArrayWithindex:(NSInteger)index
{
    NSInteger upIndex = [self getPageIndex:index - 1];
    NSInteger nextIndex = [self getPageIndex:index + 1];
//    NSLog(@"%ld--%ld--%ld", index, upIndex, nextIndex);
    NSMutableArray *storArray = [NSMutableArray arrayWithCapacity:datasArray.count];
    if(datasArray){
        [storArray addObject:[datasArray objectAtIndex:upIndex-1]];
        [storArray addObject:[datasArray objectAtIndex:currenIndex-1]];
        [storArray addObject:[datasArray objectAtIndex:nextIndex-1]];
    }

    return storArray.copy;
}
-(NSInteger)getPageIndex:(NSInteger)index
{
    if(index == 0){
        return datasArray.count;
    }
    
    if(index == datasArray.count + 1){
        return 1;
    }
    
    return index;
}
/**
 *  实现动画滚动
 */
-(void)rollingScrollView
{
    [UIView animateWithDuration:0.25 animations:^{
        if(_dragDirection == HeaderViewDragDirectionHorizontal){
            customScrollView.contentOffset = CGPointMake(1.99*customScrollView.frame.size.width, 0);
        }else if(_dragDirection == HeaderViewDragDirectionVertical){
            customScrollView.contentOffset = CGPointMake(0, 1.99*customScrollView.frame.size.height);
        }
    } completion:^(BOOL finished) {
        if(finished){
            currenIndex = [self getPageIndex:currenIndex+1];
            [self refreshDataWithImage];
            
            if(enableRolling){
                [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(rollingScrollView) object:nil];
                [self performSelector:@selector(rollingScrollView) withObject:nil afterDelay:rollingTime inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
            }
        }
    }];
}

#pragma mark -- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(enableRolling){
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(rollingScrollView) object:nil];
    }

    if(_dragDirection == HeaderViewDragDirectionHorizontal){
        NSInteger offsetX = customScrollView.contentOffset.x;
        
        if(offsetX >= 2*customScrollView.bounds.size.width){
            currenIndex = [self getPageIndex:currenIndex+1];
            [self refreshDataWithImage];
        }
        if(offsetX <= 0){
            currenIndex = [self getPageIndex:currenIndex-1];
            [self refreshDataWithImage];
        }
        
    }else if(_dragDirection == HeaderViewDragDirectionVertical){
        NSInteger offsetY = customScrollView.contentOffset.y;
        
        if(offsetY >= 2*customScrollView.bounds.size.height){
            currenIndex = [self getPageIndex:currenIndex+1];
            [self refreshDataWithImage];
        }
        if(offsetY <= 0){
            currenIndex = [self getPageIndex:currenIndex-1];
            [self refreshDataWithImage];
        }
    }
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(_dragDirection == HeaderViewDragDirectionHorizontal){
        customScrollView.contentOffset = CGPointMake(customScrollView.bounds.size.width, 0);
        
    }else if(_dragDirection == HeaderViewDragDirectionVertical){
        customScrollView.contentOffset = CGPointMake(0, customScrollView.bounds.size.height);
    }
    
    if(enableRolling){
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(rollingScrollView) object:nil];
        [self performSelector:@selector(rollingScrollView) withObject:nil afterDelay:rollingTime inModes:[NSArray arrayWithObject:NSRunLoopCommonModes]];
    }
}

#pragma mark -- UIImageView手势事件
-(void)imageViewWithHanld:(UITapGestureRecognizer *)tap
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(rollingScrollView) object:nil];
}
@end
