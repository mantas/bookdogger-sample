//
//  BDAppDelegate.h
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JASidePanelController;

@interface BDAppDelegate : UIResponder <UIApplicationDelegate>
{
    JASidePanelController *_rootViewController;
}

@property (strong, nonatomic) JASidePanelController *rootViewController;
@property (strong, nonatomic) UIWindow *window;

@end
