//
//  ViewController.m
//  CAShapeLayerTest
//
//  Created by Joe Shang on 7/22/15.
//  Copyright (c) 2015 Shang Chuanren. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onButtonClicked:(id)sender {
    if (self.shapeLayer) {
        [self.shapeLayer removeFromSuperlayer];
        self.shapeLayer = nil;
    }
    
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(56.5, 19.5)];
    [bezierPath addCurveToPoint: CGPointMake(163.5, 19.5) controlPoint1: CGPointMake(155.5, 19.5) controlPoint2: CGPointMake(163.5, 19.5)];
    [bezierPath addLineToPoint: CGPointMake(163.5, 19.5)];
    [bezierPath addLineToPoint: CGPointMake(163.5, 105.5)];
    [bezierPath addLineToPoint: CGPointMake(56.5, 105.5)];
    [bezierPath addLineToPoint: CGPointMake(56.5, 19.5)];
    [bezierPath addLineToPoint: CGPointMake(163.5, 105.5)];
    [bezierPath addLineToPoint: CGPointMake(110.5, 19.5)];
    [bezierPath addLineToPoint: CGPointMake(56.5, 105.5)];
    [bezierPath addLineToPoint: CGPointMake(163.5, 19.5)];
    [bezierPath addLineToPoint: CGPointMake(110.5, 105.5)];
    [bezierPath addLineToPoint: CGPointMake(56.5, 19.5)];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.path = bezierPath.CGPath;
    self.shapeLayer.fillColor = nil;
    self.shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    self.shapeLayer.lineWidth = 4;
    self.shapeLayer.miterLimit = 4;
    self.shapeLayer.lineCap = kCALineCapRound;
    self.shapeLayer.lineJoin = kCALineJoinRound;
    self.shapeLayer.masksToBounds = YES;
    CGPathRef boundingPath = CGPathCreateCopyByStrokingPath(self.shapeLayer.path, nil, 4, kCGLineCapRound, kCGLineJoinMiter, 4);
    self.shapeLayer.bounds = CGPathGetBoundingBox(boundingPath);
    self.shapeLayer.position = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [self.view.layer addSublayer:self.shapeLayer];
    
    CABasicAnimation *animaton = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animaton.duration = 3.0f;
    animaton.fromValue = @(0.0);
    animaton.toValue = @(1.0);
    [self.shapeLayer addAnimation:animaton forKey:@"stroke"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
