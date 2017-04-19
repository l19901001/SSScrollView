//
//  SSCustomTools.m
//  ZAKER_APP
//
//  Created by lss on 16/4/26.
//  Copyright © 2016年 lss. All rights reserved.
//

#define UIColoRGB(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#import "SSCustomColors.h"

@implementation SSCustomColors

+(instancetype)sharedAppraance
{
    static SSCustomColors *customColor;
    static dispatch_once_t toKen;
    dispatch_once(&toKen, ^{
        customColor = [[SSCustomColors alloc] init];
    });
    
    return customColor;
}

-(instancetype)init
{
    self = [super init];
    if(self){
        _separateLineColor = UIColoRGB(242, 242, 242);
        _defualtStateColor = UIColoRGB(254, 196, 45);
        _highlightStateColor = UIColoRGB(235, 235, 235);
        
    }
    
    return self;
}
@end
