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

NSString *urlString = @"https://firebasestorage.googleapis.com/v0/b/firestorechat-e64ac.appspot.com/o/intermediate_training_rec.mp4?alt=media&token=e20261d0-7219-49d2-b32d-367e1606500c";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

-(void) setupViews {
    UIView *breathMainView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
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


- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"finished downloading file");
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    //Handling data percentage of url download 
     CGFloat percentage = (double)totalBytesWritten/(double)totalBytesExpectedToWrite;
    
    dispatch_async(dispatch_get_main_queue(), ^{
       circleShapeLayer.strokeEnd = percentage;
        
    });
    
    
    
}
-(void)beginDownloadingFile {
     NSLog(@"downloading file");
    circleShapeLayer.strokeEnd = 0; //starting stroke here avoids the extra animation of stroke going to 0
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:operationQueue];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSessionDownloadTask *dowloadTask = [ urlSession downloadTaskWithURL:url];
    [dowloadTask resume];
}

- (void) handleBreathTap:(UITapGestureRecognizer *)recognizer {
    NSLog(@"BREATH Button TAPPED");
    [self beginDownloadingFile];
//    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    basicAnimation.toValue = 0;
//    basicAnimation.fromValue = [NSValue valueWithCGPoint: circleShapeLayer.position];
//    basicAnimation.duration = 2;
//    [circleShapeLayer addAnimation:basicAnimation forKey:basicAnimation.keyPath];
}



@end
