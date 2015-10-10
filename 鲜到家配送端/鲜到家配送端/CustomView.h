//
//  CustomView.h
//  练习之抽屉效果
//
//  Created by 李晓勇 on 14-11-19.
//  Copyright (c) 2014年 李晓勇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomView : UIView
{
    CGPoint openPointCenter;
    CGPoint closePointCenter;
}
-(id)initWithView:(UIView*)contentview parentView:(UIView*) parentview;

@property (nonatomic, strong) UIView *parentView; //抽屉视图的父视图
@property (nonatomic, strong) UIView *contenView; //抽屉显示内容的视图
@end
