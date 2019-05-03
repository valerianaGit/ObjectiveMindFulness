//
//  ViewController.h
//  Mindfulness
//
//  Created by Valeria Duran on 4/29/19.
//  Copyright © 2019 Valeria Duran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import "BreathViewController.h"

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

//make a new instance of breath view controller
@property BreathViewController *breathVC;


@end

