//
//  HorizontalMenuView.h
//  HorizontalMenuDemo
//
//  Created by chen on 16/1/9.
//  Copyright © 2016年 chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalMenuDelegate <NSObject>

- (void)getTag:(NSInteger)tag;

@end

@interface HorizontalMenuView : UIView

@property (nonatomic, copy) NSArray * menuArray;
@property (nonatomic, assign) id<HorizontalMenuDelegate>delegate;
- (void)setNameWithArray:(NSArray *)menuArray;

@end
