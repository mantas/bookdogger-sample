//
//  BDHomeViewController.m
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import "BDHomeViewController.h"
#import "UIViewController+RightMenuButton.h"

@implementation BDHomeViewController
- (instancetype)init
{
    self = [super init];
    self.view.backgroundColor = [UIColor greenColor];
    
    self.navigationItem.title = @"Home";
    self.navigationItem.rightBarButtonItem = [self rightMenuButton];
    
    return self;
}
@end
