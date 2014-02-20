//
//  BDMenuButton.m
//  BookDoggerSample
//
//  Created by Mantas on 20/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import "BDMenuButton.h"

@implementation BDMenuButton
+ (BDMenuButton *)buttonWithTitle:(NSString *)title
{
    BDMenuButton *btn = [self buttonWithType:UIButtonTypeRoundedRect];
    btn.backgroundColor = [UIColor clearColor];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.contentEdgeInsets = UIEdgeInsetsMake(10, 5, 5, 5);
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    
    return btn;
}
@end
