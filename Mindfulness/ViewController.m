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
//    CAShapeLayer *shapeLayer;
//    center = _mainHomeView.center;
//
//    UIBezierPath *circularPath = UIBezierPath[(arcCenter: _mainHomeView)
//
//    [[UIColor blackColor] setStroke]];
//    [[UIColor whiteColor] setFill];
//    UIBezierPath * path = [UIBezierPath bezierPath];
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
//    myLayer.fillColor = [[UIColor whiteColor] CGColor];
//    [self.layer addSublayer:myLayer];
//CGPathAddPath(aPath, nil, path.CGPath);
//
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self drawCircle];
}

-(void)drawCircle {
    
    CALayer *parentLayer = [CALayer layer];
    [self.view.layer addSubLayer:parentLayer];
    [parentLayer addSublayer: myShapeLayer];
    [parentLayer addSublayer: myLayerOverShapeLayer];
    
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    [self.mainHomeView.layer addSublayer:circleShapeLayer];
    UIBezierPath* circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:self.mainHomeView.center radius: self.mainHomeView.frame.size.width / 3 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE];
    //[circlePath stroke];
        circleShapeLayer.path = circlePath.CGPath;
    
    
    [circleShapeLayer setPath:circlePath.CGPath];
    circleShapeLayer.strokeColor = UIColor.blueColor.CGColor;
    circleShapeLayer.lineWidth = 10;
    //[circleShapeLayer addSublayer:circlePath];
    

    
    
    
    
    //[self.mainHomeView addSubview:circleShapeLayer];
    
   // UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0,0, self.mainHomeView.frame.size.width, self.mainHomeView.frame.size.height)];
//    firstView.backgroundColor = [UIColor colorWithWhite:.75 alpha:0.1];
//    firstView.layer.mask = circleShapeLayer;
//    [self.mainHomeView addSubview:circlePath];
    
    //add a button in each 1/2 M_PI
}

@end
