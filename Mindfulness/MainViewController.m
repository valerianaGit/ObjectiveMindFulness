//
//  MainViewController.m
//  Mindfulness
//
//  Created by Valeria Duran on 4/29/19.
//  Copyright © 2019 Valeria Duran. All rights reserved.
//

#import "MainViewController.h"


@interface MainViewController ()


@end

@implementation MainViewController
// MARK: - Properties
UIView *mainHomeView;
UIView *breathView;
UIView *meditateView;
UIView *journalView;
UIView *playView;



- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawCircleAndButtons];
    [self tapGestures];
    
  
    
    

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
  
}

//MARK: - UI

-(void)drawCircleAndButtons {
    //draw main view
    mainHomeView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
                            //CGRectMake(8, 50, self.view.frame.size.width - 32, self.view.frame.size.height - 140)];
    [self.view addSubview:mainHomeView];
    //draw  main circle
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    [mainHomeView.layer addSublayer:circleShapeLayer];
    UIBezierPath* circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:mainHomeView.center radius: 150 startAngle: 0 endAngle: 2 * M_PI clockwise:YES];
    circleShapeLayer.path = circlePath.CGPath;
    circleShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    //Add image buttons to view
    breathView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 100, circlePath.currentPoint.y - 50, 100, 100)];
    meditateView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 200, circlePath.currentPoint.y + 100, 100, 100)];
    journalView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 300, circlePath.currentPoint.y - 50, 100, 100)];
    playView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 200, circlePath.currentPoint.y - 200, 100, 100)];
    
    breathView.layer.cornerRadius = 50;
    meditateView.layer.cornerRadius = 50;
    journalView.layer.cornerRadius = 50;
    playView.layer.cornerRadius = 50;
    
    breathView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    meditateView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    journalView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    playView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    
    [mainHomeView addSubview:breathView];
    [mainHomeView addSubview:meditateView];
    [mainHomeView addSubview:journalView];
    [mainHomeView addSubview:playView];
    
    //Add Labels to Views
    UILabel *breathLabel = [[UILabel alloc] initWithFrame:CGRectMake(breathView.center.x - 40, breathView.center.y - 10, 80, 30)];
    UILabel *meditateLabel = [[UILabel alloc] initWithFrame:CGRectMake(meditateView.center.x - 40, meditateView.center.y - 10, 80, 30)];
    UILabel *journalLabel = [[UILabel alloc] initWithFrame:CGRectMake(journalView.center.x - 40, journalView.center.y - 10, 80, 30)];
    UILabel *playLabel = [[UILabel alloc] initWithFrame:CGRectMake(playView.center.x - 40, playView.center.y - 10, 80, 30)];

    breathLabel.text = @"Breath";
    meditateLabel.text = @"Meditate";
    journalLabel.text = @"Journal";
    playLabel.text = @"Play";
    
    [breathLabel setTextColor:[UIColor blackColor]];
    [meditateLabel setTextColor:[UIColor blackColor]];
    [journalLabel setTextColor:[UIColor blackColor]];
    [playLabel setTextColor:[UIColor blackColor]];
    
     breathLabel.textAlignment = NSTextAlignmentCenter;
     meditateLabel.textAlignment = NSTextAlignmentCenter;
     journalLabel.textAlignment = NSTextAlignmentCenter;
     playLabel.textAlignment = NSTextAlignmentCenter;
   
    [mainHomeView addSubview:breathLabel];
    [mainHomeView addSubview:meditateLabel];
    [mainHomeView addSubview:journalLabel];
    [mainHomeView addSubview:playLabel];
    
    breathView.userInteractionEnabled = YES;
    meditateView.userInteractionEnabled = YES;
    journalView.userInteractionEnabled = YES;
    playView.userInteractionEnabled = YES;
    
}

//MARK: - Gesture Recognizers

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


-(void)tapGestures {
    UITapGestureRecognizer *breathTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBreathTap:)];
    UITapGestureRecognizer *meditateTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleMeditateTap)];
    UITapGestureRecognizer *journalTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleJournalTap)];
    UITapGestureRecognizer *playTap = [[UITapGestureRecognizer alloc]
        initWithTarget:self action:@selector(handlePlayTap)];
    
    breathTap.delegate = self;
    meditateTap.delegate = self;
    journalTap.delegate = self;
    playTap.delegate = self;
    
    
    [breathView addGestureRecognizer: breathTap];
    [meditateView addGestureRecognizer: meditateTap];
    [journalView addGestureRecognizer: journalTap];
    [playView addGestureRecognizer: playTap];
}


//MARK: - Actions and Segues

- (void)handleBreathTap:(UITapGestureRecognizer *)sender {
   // segue to the breath View controller
    CGPoint breathLocation = [sender locationInView:breathView];
//     CGPoint meditateLocation = [sender locationInView:meditateView];
//    CGPoint journalLocation = [sender locationInView:journalView];
//    CGPoint playLocation = [sender locationInView:playView];
//    if (sender.breathLocation) {
//
//    }
    NSLog(@"BREATH TAPPED");
    self.breathVC = [[BreathViewController alloc] init];
    self.breathVC.view.frame = CGRectMake(mainHomeView.frame.origin.x, mainHomeView.frame.origin.y, mainHomeView.frame.size.width, mainHomeView.frame.size.height);
    [self.view addSubview:self.breathVC.view];
   // [self presentViewController:self.breathVC animated:YES completion:nil];
}
- (void)handleMeditateTap {
    // segue to the meditate View controller
     NSLog(@"MEDITATION TAPPED");
    self.meditateVC = [[MeditateCollectionViewController alloc]init];
    self.meditateVC.view.frame = CGRectMake(mainHomeView.frame.origin.x, mainHomeView.frame.origin.y, mainHomeView.frame.size.width, mainHomeView.frame.size.height);
    [self.view addSubview:self.meditateVC.view];
    //[self presentViewController:self.meditateVC animated:YES completion:nil];
}
- (void)handleJournalTap {
    // segue to the journal View controller
     NSLog(@"journal TAPPED");
    self.journalVC = [[JournalTableViewController alloc] init];
    self.journalVC.view.frame = CGRectMake(mainHomeView.frame.origin.x, mainHomeView.frame.origin.y, mainHomeView.frame.size.width, mainHomeView.frame.size.height);
    [self.view addSubview:self.journalVC.view];
   // [self presentViewController:self.journalVC animated:YES completion:nil];
}
- (void)handlePlayTap {
    // segue to the play View controller
     NSLog(@"play TAPPED");
    self.playVC = [[PlayCollectionViewController alloc]init];
    self.playVC.view.frame = CGRectMake(mainHomeView.frame.origin.x, mainHomeView.frame.origin.y, mainHomeView.frame.size.width, mainHomeView.frame.size.height);
    [self.view addSubview:self.playVC.view];
   // [self presentViewController:self.playVC animated:YES completion:nil];
}









@end
