//
//  ViewController.m
//  Mindfulness
//
//  Created by Valeria Duran on 4/29/19.
//  Copyright © 2019 Valeria Duran. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

//MARK: Properties
@property (weak, nonatomic) IBOutlet UIView *mainHomeView;

@property (weak, nonatomic) IBOutlet UIView *breathButton;
@property (weak, nonatomic) IBOutlet UIView *meditateButton;
@property (weak, nonatomic) IBOutlet UIView *journalButton;
@property (weak, nonatomic) IBOutlet UIView *playButton;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *breathTapGesture;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *playTapGesture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *journalTapGesture;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *meditateTapGesture;







@end

@implementation ViewController

UIView *breathView;
UIView *meditateView;
UIView *journalView;
UIView *playView;







- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeViews];
    [self tapGestures];
    
  
    
    

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self drawCircleAndButtons];
}

-(void)drawCircleAndButtons {
    CAShapeLayer *circleShapeLayer = [CAShapeLayer layer];
    [self.mainHomeView.layer addSublayer:circleShapeLayer];
    UIBezierPath* circlePath = [UIBezierPath bezierPath];
    [circlePath addArcWithCenter:self.mainHomeView.center radius: 150 startAngle: 0 endAngle: 2 * M_PI clockwise:YES];
    //draw  main circle
    circleShapeLayer.path = circlePath.CGPath;
//    circleShapeLayer.strokeColor = UIColor.blueColor.CGColor;
//    circleShapeLayer.lineWidth = 10;
    circleShapeLayer.fillColor = [[UIColor clearColor] CGColor];
    
    //Add image buttons to view
    breathView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 100, circlePath.currentPoint.y - 50, 100, 100)];
    meditateView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 200, circlePath.currentPoint.y + 150, 100, 100)];
    journalView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 300, circlePath.currentPoint.y - 50, 100, 100)];
    playView = [[UIView alloc] initWithFrame:CGRectMake( circlePath.currentPoint.x - 200, circlePath.currentPoint.y - 250, 100, 100)];
    
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
   
    [self.mainHomeView addSubview:breathLabel];
    [self.mainHomeView addSubview:meditateLabel];
    [self.mainHomeView addSubview:journalLabel];
    [self.mainHomeView addSubview:playLabel];
    
    //Add gesture recognizer to Views
    breathView.userInteractionEnabled = YES;
    meditateView.userInteractionEnabled = YES;
    journalView.userInteractionEnabled = YES;
    playView.userInteractionEnabled = YES;
    
}

-(void)tapGestures {
    UITapGestureRecognizer *breathTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBreathTap)];
    UITapGestureRecognizer *meditateTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleMeditateTap)];
    UITapGestureRecognizer *journalTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleJournalTap)];
    UITapGestureRecognizer *playTap = [[UITapGestureRecognizer alloc]
        initWithTarget:self action:@selector(handlePlayTap)];
    
    [breathView addGestureRecognizer: breathTap];
    [meditateView addGestureRecognizer: meditateTap];
    [journalView addGestureRecognizer: journalTap];
    [playView addGestureRecognizer: playTap];
}




- (void)handleBreathTap {
   // segue to the breath View controller
    NSLog(@"BREATH TAPPED");
//    ViewController *breathVC = [[ViewController alloc]init];
//    [self presentViewController:breathVC animated:YES completion:nil];
    
}
- (void)handleMeditateTap {
    // segue to the meditate View controller
}
- (void)handleJournalTap {
    // segue to the journal View controller
}
- (void)handlePlayTap {
    // segue to the play View controller
}

-(void) customizeViews {
    
    
    self.breathButton.layer.cornerRadius = self.breathButton.frame.size.width / 2;
    self.meditateButton.layer.cornerRadius = self.meditateButton.frame.size.width / 2;
    self.journalButton.layer.cornerRadius = 50;
    self.playButton.layer.cornerRadius = 50;
    
    self.breathButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    self.meditateButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    self.journalButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    self.playButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"breath"]];
    
    
    
    
}

- (IBAction)breathTapPressed:(UITapGestureRecognizer *)sender {
    
}
- (IBAction)playTapPressed:(UITapGestureRecognizer *)sender {
    
}
- (IBAction)journalTapPressed:(UITapGestureRecognizer *)sender {
    
}
- (IBAction)meditateTapPressed:(UITapGestureRecognizer *)sender {
    
}


@end
