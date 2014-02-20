//
//  BDHomeViewController.m
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import "BDHomeViewController.h"
#import "UIViewController+RightMenuButton.h"
#import "BDExpandableButtonView.h"

@implementation BDHomeViewController
- (instancetype)init
{
    self = [super init];
    
    self.navigationItem.title = @"Home";
    self.navigationItem.rightBarButtonItem = [self rightMenuButton];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scrollView = [[UIScrollView alloc] init];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.backgroundColor = [UIColor colorWithRed:127/255.0 green:199/255.0 blue:71/255.0 alpha:1];
    [self.view addSubview:scrollView];
    
    scrollViewInset = [[UIView alloc] init];
    scrollViewInset.translatesAutoresizingMaskIntoConstraints = NO;
    [scrollView addSubview:scrollViewInset];
    
    NSDictionary *scrollViewsDict = NSDictionaryOfVariableBindings(scrollView, scrollViewInset);
    [self.view addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"H:|[scrollView]|"
        options:0 metrics:nil views:scrollViewsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|[scrollView]|"
        options:0 metrics:nil views:scrollViewsDict]];
    
    [scrollView addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"H:|[scrollViewInset]|"
        options:0 metrics:nil views:scrollViewsDict]];
    
    [scrollView addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|[scrollViewInset]|"
        options:0 metrics:nil views:scrollViewsDict]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:scrollViewInset
        attribute:NSLayoutAttributeWidth
        relatedBy:NSLayoutRelationEqual
        toItem:self.view
        attribute:NSLayoutAttributeWidth
        multiplier:1 constant:0]];
    
    sectionTitleLabel = [[UILabel alloc] init];
    sectionTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    sectionTitleLabel.textColor = [UIColor whiteColor];
    sectionTitleLabel.textAlignment = NSTextAlignmentCenter;
    sectionTitleLabel.text = @"CHAMPIONS LEAGUE KNOCKOUT";
    sectionTitleLabel.font = [UIFont boldSystemFontOfSize:16];
    [scrollViewInset addSubview:sectionTitleLabel];
    
    button1 = [[BDExpandableButtonView alloc] initWithTitle:@"Soccer Players"];
    [scrollViewInset addSubview:button1];
    
    button2 = [[BDExpandableButtonView alloc] initWithTitle:@"Champions League"];
    [scrollViewInset addSubview:button2];
    
    button3 = [[BDExpandableButtonView alloc] initWithTitle:@"Real Madrid"];
    [scrollViewInset addSubview:button3];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(sectionTitleLabel,
        button1, button2, button3);
    
    for(NSString *viewName in views.allKeys){
        NSString *formatString = [NSString stringWithFormat:@"H:|-[%@]-|", viewName];
        
        [scrollViewInset addConstraints:[NSLayoutConstraint
            constraintsWithVisualFormat:formatString
            options:0 metrics:nil views:views]];
    }
    
    [scrollViewInset addConstraints:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|-[sectionTitleLabel]-(15)-[button1]-[button2]-[button3]-|"
        options:0 metrics:nil views:views]];
}
@end
