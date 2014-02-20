//
//  BDHomeViewController.h
//  BookDoggerSample
//
//  Created by Mantas on 19/02/14.
//  Copyright (c) 2014 Mantas Masalskis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BDExpandableButtonView;

@interface BDHomeViewController : UIViewController
{
    UILabel *sectionTitleLabel;
    BDExpandableButtonView *button1, *button2, *button3;
    UIScrollView *scrollView;
    UIView *scrollViewInset;
}
@end
