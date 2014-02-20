//
//  BDSmallInExpandableButton.m
//  BookDoggerSample
//
//  Created by Mantas on 20/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import "BDSmallInExpandableButton.h"

@implementation BDSmallInExpandableButton
+ (BDSmallInExpandableButton *)buttonWithTitle:(NSString *)title
{
    BDSmallInExpandableButton *btn = [self buttonWithType:UIButtonTypeRoundedRect];
    btn.backgroundColor = [UIColor whiteColor];
    btn.layer.cornerRadius = 3;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.layer.shadowColor = [UIColor blackColor].CGColor;
    btn.layer.shadowRadius = 3;
    btn.layer.shadowOffset = CGSizeMake(0, 3);
    btn.layer.shadowOpacity = 0.7;
    btn.layer.cornerRadius = 3;
    
    return btn;
}
@end
