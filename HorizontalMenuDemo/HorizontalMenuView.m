//
//  HorizontalMenuView.m
//  HorizontalMenuDemo
//
//  Created by chen on 16/1/9.
//  Copyright © 2016年 chen. All rights reserved.
//

#import "HorizontalMenuView.h"

@interface HorizontalMenuView()

@property (nonatomic, assign) CGFloat space;
@property (nonatomic, strong) UIView * markLine;

@end

@implementation HorizontalMenuView

- (void)setNameWithArray:(NSArray *)menuArray {
    _menuArray = menuArray;
    
    //设置每个宽度
    _space = self.frame.size.width / _menuArray.count;
    for (int i = 0; i < _menuArray.count; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(_space * i, 0, _space, self.frame.size.height);
        btn.tag = i + 100;
        if (btn.tag == 100) {
            btn.enabled = NO;
        }
        
        NSMutableAttributedString * nomalTitle = [[NSMutableAttributedString alloc]initWithString:_menuArray[i]];
        [nomalTitle addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor grayColor]} range:NSMakeRange(0, [nomalTitle length])];
        [btn setAttributedTitle:nomalTitle forState:UIControlStateNormal];
        
        NSMutableAttributedString * seletedTitle = [[NSMutableAttributedString alloc]initWithString:_menuArray[i]];
        [seletedTitle addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:19], NSForegroundColorAttributeName: [UIColor redColor]} range:NSMakeRange(0, [seletedTitle length])];
        [btn setAttributedTitle:seletedTitle forState:UIControlStateDisabled];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        if (i > 0 && self.frame.size.height > 16) {
            UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(_space * i, 8, 1, self.frame.size.height - 16)];
            lineView.backgroundColor = [UIColor grayColor];
            [self addSubview:lineView];
        }
    }
    
    //底部划线
    UIBezierPath * linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(0, self.frame.size.height - 2.5)];
    [linePath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height - 2.5)];
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor grayColor].CGColor;
//    shapeLayer.fillColor = [UIColor grayColor].CGColor;
    shapeLayer.lineWidth = 2.5;
    shapeLayer.path = linePath.CGPath;
    [self.layer addSublayer:shapeLayer];
    
    
    //底部选中时的下划线
    _markLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 4, _space + 1, 3)];
    _markLine.backgroundColor = [UIColor redColor];
    [self addSubview:_markLine];
}

- (void)btnClick:(UIButton *)btn {
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton * subBtn = (UIButton *)subView;
            if (subView.tag == btn.tag) {
                [subBtn setEnabled:NO];
            } else {
                [subBtn setEnabled:YES];
            }
        }
    }
    [UIView animateWithDuration:.2f animations:^{
        CGRect markFrame = _markLine.frame;
        markFrame.origin.x = (btn.tag - 100) * _space;
        _markLine.frame = markFrame;
    }];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(getTag:)]) {
        [self.delegate getTag:btn.tag];
    }
    
}


@end
