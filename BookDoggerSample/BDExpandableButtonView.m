//
//  BDExpandableButtonView.m
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import "BDExpandableButtonView.h"
#import "BDSmallInExpandableButton.h"

@interface BDExpandableButtonView()
- (void)buttonTapped;
- (void)otherExpandedNotification:(NSNotification *)notification;
- (void)setExpanded:(BOOL)nextValue;
@end

@implementation BDExpandableButtonView
- (instancetype) initWithTitle:(NSString *)title{
    self = [super init];
    
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(otherExpandedNotification:) name:BDExpandableButtonOpenedNotification object:nil];
    
    mainButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    mainButton.translatesAutoresizingMaskIntoConstraints = NO;
    mainButton.backgroundColor = [UIColor whiteColor];
    [mainButton setTitle:title forState:UIControlStateNormal];
    [mainButton addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    mainButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [mainButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    mainButton.layer.shadowColor = [UIColor blackColor].CGColor;
    mainButton.layer.shadowRadius = 5;
    mainButton.layer.shadowOffset = CGSizeMake(0, 5);
    mainButton.layer.shadowOpacity = 0.5;
    mainButton.layer.cornerRadius = 3;
    mainButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    mainButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [self addSubview:mainButton];
    
    dropView = [[UIView alloc] init];
    dropView.translatesAutoresizingMaskIntoConstraints = NO;
    dropView.backgroundColor = [UIColor colorWithRed:63/255.0 green:99/255.0 blue:35/255.0 alpha:1];
    dropView.hidden = YES;
    dropView.layer.cornerRadius = YES;
    [self addSubview:dropView];
    
    dropViewLabel = [[UILabel alloc] init];
    dropViewLabel.text = @"Is there white blood in your veins?";
    dropViewLabel.font = [UIFont systemFontOfSize:12];
    dropViewLabel.textColor = [UIColor whiteColor];
    dropViewLabel.textAlignment = NSTextAlignmentCenter;
    dropViewLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [dropView addSubview:dropViewLabel];
    
    playNowButton = [BDSmallInExpandableButton buttonWithTitle:@"Play now!"];
    [dropView addSubview:playNowButton];

    challengeButton = [BDSmallInExpandableButton buttonWithTitle:@"Challenge"];
    [dropView addSubview:challengeButton];
    
    rankingsButton = [BDSmallInExpandableButton buttonWithTitle:@"Rankings"];
    [dropView addSubview:rankingsButton];
    
    discussionsButton = [BDSmallInExpandableButton buttonWithTitle:@"Discussions"];
    [dropView addSubview:discussionsButton];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(mainButton, dropView,
        playNowButton, challengeButton, rankingsButton, discussionsButton, dropViewLabel);
    
    [dropView addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"|-(4)-[dropViewLabel]-(4)-|"
        options:0 metrics:nil views:views]];
    
    [dropView addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"|-(8)-[playNowButton(==challengeButton)]-(8)-[challengeButton(==playNowButton)]-(8)-|"
        options:0 metrics:nil views:views]];
    
    [dropView addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"|-(8)-[rankingsButton(==discussionsButton)]-(8)-[discussionsButton(==rankingsButton)]-(8)-|"
        options:0 metrics:nil views:views]];
    
    [dropView addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|-(3)-[dropViewLabel]-(3)-[playNowButton(==rankingsButton)]-(8)-[rankingsButton(==playNowButton)]-(8)-|"
        options:0 metrics:nil views:views]];
    
    [dropView addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|-(3)-[dropViewLabel]-(3)-[challengeButton(==discussionsButton)]-(8)-[discussionsButton(==challengeButton)]-(8)-|"
        options:0 metrics:nil views:views]];
    
    [self addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"H:|[mainButton]|"
        options:0 metrics:nil views:views]];
    
    [self addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"H:|-[dropView]-|"
        options:0 metrics:nil views:views]];
    
    [self addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|[mainButton][dropView]"
        options:0 metrics:nil views:views]];
    
    
    dropViewHeightConstraint = [NSLayoutConstraint constraintWithItem:dropView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
    [self addConstraint:dropViewHeightConstraint];
    
    completeConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:50];
    [self addConstraint:completeConstraint];
    
    return self;
}

- (void)buttonTapped
{
    [self setExpanded:!isExpanded];
}
- (void)setExpanded:(BOOL)nextValue
{
    isExpanded = nextValue;
    
    
    if(isExpanded){
        [[NSNotificationCenter defaultCenter]
            postNotificationName:BDExpandableButtonOpenedNotification object:self];
    }
    
    dropView.hidden = !isExpanded;
    completeConstraint.constant = nextValue ? 150 : 50;
}

- (void)otherExpandedNotification:(NSNotification *)notification
{
    if(notification.object != self && isExpanded){
        [self setExpanded:NO];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
