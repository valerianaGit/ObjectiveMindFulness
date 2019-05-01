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
    [self drawCircleAndButtons];
}

-(void)drawCircleAndButtons {    
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    [self.mainHomeView.layer addSublayer:circleShapeLayer];
    UIBezierPath* circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:self.mainHomeView.center radius: 150 startAngle: 0 endAngle: 2 * M_PI clockwise:TRUE];
    //draw  main circle
    circleShapeLayer.path = circlePath.CGPath;
    circleShapeLayer.strokeColor = UIColor.blueColor.CGColor;
    circleShapeLayer.lineWidth = 10;
    circleShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    //Add image buttons to view
    UIView *breathView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 50, circlePath.currentPoint.y - 50, 100, 100)];
    UIView *meditateView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 200, circlePath.currentPoint.y + 150, 100, 100)];
    UIView *journalView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 350, circlePath.currentPoint.y - 50, 100, 100)];
    UIView *playView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 200, circlePath.currentPoint.y - 250, 100, 100)];
    
    breathView.layer.cornerRadius = 50;
    meditateView.layer.cornerRadius = 50;
    journalView.layer.cornerRadius = 50;
    playView.layer.cornerRadius = 50;
    
    breathView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    meditateView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    journalView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    playView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    
    [self.mainHomeView addSubview:breathView];
    [self.mainHomeView addSubview:meditateView];
    [self.mainHomeView addSubview:journalView];
    [self.mainHomeView addSubview:playView];
}

@end
