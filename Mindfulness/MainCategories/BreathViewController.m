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

CAShapeLayer *circleShapeLayer;

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
    UIBezierPath* circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:breathMainView.center radius: 100 startAngle: -(M_PI / 2) endAngle: 2 * M_PI clockwise:YES];
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

- (void) handleBreathTap:(UITapGestureRecognizer *)recognizer {
    //CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"BREATH Button TAPPED");
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    basicAnimation.toValue = 0;//[NSValue valueWithCGPoint: circleShapeLayer.position];
    basicAnimation.fromValue = [NSValue valueWithCGPoint: circleShapeLayer.position]; //1;
    basicAnimation.duration = 2;
    //basicAnimation.fillMode = kCAFillModeBackwards;
   // [basicAnimation isRemovedOnCompletion];
    [circleShapeLayer addAnimation:basicAnimation forKey:basicAnimation.keyPath];
}


@end
