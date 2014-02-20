//
//  BDExpandableButtonView.h
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BDExpandableButtonOpenedNotification @"BDExpandableButtonOpenedNotification"

@class  BDSmallInExpandableButton;

@interface BDExpandableButtonView : UIView
{
    UIButton *mainButton;
    UIView *dropView;
    UILabel *dropViewLabel;
    BDSmallInExpandableButton *playNowButton, *challengeButton, *rankingsButton, *discussionsButton;
    NSLayoutConstraint *dropViewHeightConstraint;
    NSLayoutConstraint *completeConstraint;
    
    BOOL isExpanded;
}

- (instancetype) initWithTitle:(NSString *)title;
@end
