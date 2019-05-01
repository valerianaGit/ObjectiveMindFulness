//
//  ViewController.m
//  Mindfulness
//
//  Created by Valeria Duran on 4/29/19.
//  Copyright © 2019 Valeria Duran. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *mainHomeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self drawCircle];
}

-(void)drawCircle {
    
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    [self.mainHomeView.layer addSublayer:circleShapeLayer];
    UIBezierPath* circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:self.mainHomeView.center radius: 150 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE]; //draw circle
    circleShapeLayer.path = circlePath.CGPath;
    [circleShapeLayer setPath:circlePath.CGPath];
    circleShapeLayer.strokeColor = UIColor.blueColor.CGColor;
    circleShapeLayer.lineWidth = 10;
    circleShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    //add a button in each 1/2 M_PI.. could we create these with a for loop?
    // 1- create buttons
    CAShapeLayer *breathButtonLayer = [CAShapeLayer layer];
    CAShapeLayer *meditateButtonLayer = [CAShapeLayer layer];
    CAShapeLayer *journalButtonLayer = [CAShapeLayer layer];
    CAShapeLayer *playButtonLayer = [CAShapeLayer layer];
  //Centers of button circles
    CGPoint pointPi = CGPointMake(circlePath.currentPoint.x - 300, circlePath.currentPoint.y);
     CGPoint pointHalfPi = CGPointMake(circlePath.currentPoint.x - 150, circlePath.currentPoint.y - 150);
     CGPoint pointOneAndAHalfPi = CGPointMake(circlePath.currentPoint.x - 150, circlePath.currentPoint.y + 150);
    //Draw new bezier paths for each button
    UIBezierPath *buttonPath = [UIBezierPath bezierPath];
    UIBezierPath *buttonPathTwo = [UIBezierPath bezierPath];
    UIBezierPath *buttonPathThree = [UIBezierPath bezierPath];
    UIBezierPath *buttonPathFour = [UIBezierPath bezierPath];
    [buttonPath addArcWithCenter:circlePath.currentPoint radius: 50 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE];
     [buttonPathTwo addArcWithCenter:pointHalfPi radius: 50 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE];
    [buttonPathThree addArcWithCenter:pointPi radius: 50 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE];
    [buttonPathFour addArcWithCenter:pointOneAndAHalfPi radius: 50 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE];
    breathButtonLayer.path = buttonPath.CGPath;
    meditateButtonLayer.path = buttonPathTwo.CGPath;
    journalButtonLayer.path = buttonPathThree.CGPath;
    playButtonLayer.path = buttonPathFour.CGPath;

    // 2- add them to the circle
    [self.mainHomeView.layer addSublayer:breathButtonLayer];
    [self.mainHomeView.layer addSublayer:meditateButtonLayer];
    [self.mainHomeView.layer addSublayer:journalButtonLayer];
    [self.mainHomeView.layer addSublayer:playButtonLayer];
    
    //FOR every 1/2 pi, add point to array
}

@end
