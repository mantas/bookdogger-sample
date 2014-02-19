//
//  UIViewController+RightMenuButton.m
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import "UIViewController+RightMenuButton.h"
#import "BDAppDelegate.h"
#import <JASidePanelController.h>

@implementation UIViewController (RightMenuButton)
- (UIBarButtonItem *)rightMenuButton
{
    BDAppDelegate *delegate = [UIApplication sharedApplication].delegate;
    JASidePanelController *rootViewController = delegate.rootViewController;
    
    return [[UIBarButtonItem alloc] initWithImage:[[rootViewController class] defaultImage]
        style:UIBarButtonItemStylePlain
        target:rootViewController
        action:@selector(toggleRightPanel:)];
}

@end
