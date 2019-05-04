//
//  MainViewController.h
//  Mindfulness
//
//  Created by Valeria Duran on 4/29/19.
//  Copyright © 2019 Valeria Duran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import "BreathViewController.h"
#import "MeditateCollectionViewController.h"
#import "JournalTableViewController.h"
#import "PlayCollectionViewController.h"

@interface MainViewController : UIViewController<UIGestureRecognizerDelegate>

//make a new instance of breath view controller
@property BreathViewController *breathVC;
@property MeditateCollectionViewController *meditateVC;
@property JournalTableViewController *journalVC;
@property PlayCollectionViewController *playVC;

@end

