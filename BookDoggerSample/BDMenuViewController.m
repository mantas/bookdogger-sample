//
//  BDMenuViewController.m
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import "BDMenuViewController.h"
#import "BDMenuButton.h"

@implementation BDMenuViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *avatar = [UIImage imageNamed:@"avatar.jpg"];
    
    avatarView = [[UIImageView alloc] initWithImage:avatar];
    avatarView.translatesAutoresizingMaskIntoConstraints = NO;
    avatarView.layer.borderColor = [UIColor whiteColor].CGColor;
    avatarView.layer.borderWidth = 3;
    avatarView.layer.cornerRadius = 20;
    avatarView.layer.masksToBounds = YES;
    [self.view addSubview: avatarView];
    
    usernameLabel = [[UILabel alloc] init];
    usernameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    usernameLabel.textAlignment = NSTextAlignmentLeft;
    usernameLabel.text = @"xCall";
    usernameLabel.textColor = [UIColor whiteColor];
    usernameLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:usernameLabel];
    
    rankLabel = [[UILabel alloc] init];
    rankLabel.translatesAutoresizingMaskIntoConstraints = NO;
    rankLabel.textAlignment = NSTextAlignmentLeft;
    rankLabel.text = @"Novice";
    rankLabel.textColor = [UIColor whiteColor];
    rankLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:rankLabel];
    
    homeButton = [BDMenuButton buttonWithTitle:@"Home"];
    [self.view addSubview:homeButton];
    
    topicsButton = [BDMenuButton buttonWithTitle:@"Topics"];
    [self.view addSubview:topicsButton];
    
    friendsButton = [BDMenuButton buttonWithTitle:@"Friends"];
    [self.view addSubview:friendsButton];
    
    historyButton = [BDMenuButton buttonWithTitle:@"History"];
    [self.view addSubview:historyButton];
    
    UIView *grayMarker = [[UIView alloc] init];
    grayMarker.translatesAutoresizingMaskIntoConstraints = NO;
    grayMarker.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:grayMarker];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(avatarView,
        usernameLabel, rankLabel, grayMarker,
        homeButton, topicsButton, friendsButton, historyButton);
    
    [self.view addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"[avatarView(40)]-[usernameLabel]|"
        options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"[avatarView]-[rankLabel]|"
        options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"|[grayMarker]|"
        options:0 metrics:nil views:views]];
    
    NSLayoutConstraint *avatarOffsetConstraint = [NSLayoutConstraint
        constraintWithItem:avatarView
        attribute:NSLayoutAttributeLeft
        relatedBy:NSLayoutRelationEqual
        toItem:self.view
        attribute:NSLayoutAttributeCenterX
        multiplier:0.8 constant:10];
    
    [self.view addConstraint: avatarOffsetConstraint];
    
    [self.view addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|-(22)-[avatarView(40)]"
        options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|-(24)-[usernameLabel]-(0)-[rankLabel]"
        options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:[rankLabel]-(20)-[grayMarker(1)][homeButton]-[topicsButton]-[friendsButton]-[historyButton]"
        options:0 metrics:nil views:views]];
    
    for(BDMenuButton *btn in @[homeButton, topicsButton, friendsButton, historyButton]){
        NSLayoutConstraint *constraint = [NSLayoutConstraint
            constraintWithItem:btn
            attribute:NSLayoutAttributeLeft
            relatedBy:NSLayoutRelationEqual
            toItem:avatarView
            attribute:NSLayoutAttributeLeft
            multiplier:1 constant:0];
        
        [self.view addConstraint:constraint];
    }
}
@end
