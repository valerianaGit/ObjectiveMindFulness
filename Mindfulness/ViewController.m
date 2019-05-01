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
    [circlePath addArcWithCenter:self.mainHomeView.center radius: self.mainHomeView.frame.size.width / 3 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE]; //draw circle
    circleShapeLayer.path = circlePath.CGPath;
    [circleShapeLayer setPath:circlePath.CGPath];
    circleShapeLayer.strokeColor = UIColor.blueColor.CGColor;
    circleShapeLayer.lineWidth = 10;
    circleShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    //add a button in each 1/2 M_PI.. could we create these with a for loop?
    // 1- create buttons
    CAShapeLayer *breathButtonLayer = [CAShapeLayer layer];
    CAShapeLayer *meditateButtonLayer = [CAShapeLayer layer];
    //UIButton *breathButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButton *meditateButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButton *journalButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //Center Points
    CGPoint pointPi = CGPointMake(circlePath.currentPoint.x * M_PI, circlePath.currentPoint.y * M_PI);
    
    
    UIBezierPath* buttonPath = [UIBezierPath bezierPath];
    //UIBezierPath *buttonPathTwo = [UIBezierPath bezierPath];
    [buttonPath addArcWithCenter:circlePath.currentPoint radius: 50 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE];
   // [buttonPathTwo addArcWithCenter:pointPi radius: 50 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE];

    breathButtonLayer.path = buttonPath.CGPath;
   // [breathButtonLayer setPath:buttonPath.CGPath];
    
//    meditateButtonLayer.path = buttonPathTwo.CGPath;
//    [meditateButtonLayer setPath:buttonPathTwo.CGPath];
    // 2- add them to the circle
     [self.mainHomeView.layer addSublayer:breathButtonLayer];
    //[self.mainHomeView.layer addSublayer:meditateButtonLayer];
   
    //    [path moveToPoint:point1];
    //    [path addQuadCurveToPoint:point3 controlPoint:point2];
    //    [path addQuadCurveToPoint:point5 controlPoint:point4];
    //    [path setLineWidth:2.0f];
    //    [path stroke];
    //    [path fill];
    //
    //    aPath = CGPathCreateMutable();
    //    CGPathAddEllipseInRect(aPath, nil, outline);
    //    CGPathCloseSubpath(aPath);
    //    pathCopy = CGPathCreateCopyByTransformingPath(aPath, nil);
    //    myLayer = nil;
    //    myLayer = [CAShapeLayer layer];
    //    myLayer.path = pathCopy;
   
    //CGPathAddPath(aPath, nil, path.CGPath);
    //
    
    //FOR every 1/2 pi, add point to array
}

@end
