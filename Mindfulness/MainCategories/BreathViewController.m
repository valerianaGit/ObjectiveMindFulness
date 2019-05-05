//
//  BreathViewController.m
//  Mindfulness
//
//  Created by Valeria Duran on 5/3/19.
//  Copyright © 2019 Valeria Duran. All rights reserved.
//

#import "BreathViewController.h"

@interface BreathViewController ()

@end

@implementation BreathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

-(void) setupViews {
    UIView *breathMainView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];                              //CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [breathMainView setBackgroundColor:UIColor.whiteColor];
    [self.view addSubview:breathMainView];
    
    //draw  main circle
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    [breathMainView.layer addSublayer:circleShapeLayer];
    UIBezierPath* circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:breathMainView.center radius: 100 startAngle: 0 endAngle: 2 * M_PI clockwise:YES];
    circleShapeLayer.path = circlePath.CGPath;
    circleShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    circleShapeLayer.strokeColor = UIColor.blueColor.CGColor;
    circleShapeLayer.lineWidth = 10;
    
    
}


@end
