//
//  BDMenuViewController.h
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDMenuButton.h"

@interface BDMenuViewController : UIViewController
{
    UIImageView *avatarView;
    UILabel *usernameLabel, *rankLabel;
    BDMenuButton *homeButton, *topicsButton, *friendsButton, *historyButton;
}

@end
