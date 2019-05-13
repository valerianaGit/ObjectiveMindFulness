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
UIView *breathMainView;
CAShapeLayer *circleShapeLayer;
UILabel *breatheLabel;

@implementation BreathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

-(void) setupViews {
    breathMainView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [breathMainView setBackgroundColor:UIColor.whiteColor];
    [self.view addSubview:breathMainView];
    //Add center label
    breatheLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    breatheLabel.text = @"Breath";
    breatheLabel.textAlignment = NSTextAlignmentCenter;
    breatheLabel.center = self.view.center;
    [self.view addSubview:breatheLabel];
    //draw  main circle
    UIBezierPath* circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:breathMainView.center radius: 100 startAngle: -M_PI/2 endAngle: 2 * M_PI clockwise:YES];
    //grey base track
    CAShapeLayer *track = [CAShapeLayer layer];
    track.path = circlePath.CGPath;
    track.strokeColor = UIColor.grayColor.CGColor;
    track.lineWidth = 10;
    track.fillColor = [[UIColor clearColor] CGColor];
    [breathMainView.layer addSublayer:track];
    //main moving track
    circleShapeLayer = [CAShapeLayer layer];
    circleShapeLayer.path = circlePath.CGPath;
    circleShapeLayer.strokeColor = UIColor.blueColor.CGColor;
    circleShapeLayer.lineWidth = 10;
    circleShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    circleShapeLayer.lineCap = kCALineCapRound;
    [breathMainView.layer addSublayer:circleShapeLayer];
    //Add gesture recognizer
    UITapGestureRecognizer *breathTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBreathTap:)];
    [breathMainView addGestureRecognizer: breathTap];
}

//MARK: - GestureRecognizer
- (void) handleBreathTap:(UITapGestureRecognizer *)recognizer {
    NSLog(@"BREATH Button TAPPED");
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation.toValue = 0;
    basicAnimation.fromValue = [NSValue valueWithCGPoint: circleShapeLayer.position];
    basicAnimation.duration = 2;
    [circleShapeLayer addAnimation:basicAnimation forKey:basicAnimation.keyPath];
}



@end
