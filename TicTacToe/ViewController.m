//
//  ViewController.m
//  TicTacToe
//
//  Created by Lydia Moraga on 7/3/15.
//  Copyright (c) 2015 Lydia Moraga. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *topLeftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *topMiddleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *topRightImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midLeftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midMiddleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *midRightImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomLeftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomMiddleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomRightImageView;
@property (weak, nonatomic) IBOutlet UIImageView *roundImageView;

@property NSArray *imageViews;

@property CGPoint roundImageOriginalPosition;

//-(IBAction)onResetButtonPressed:(UIButton *)resetButton;


-(void)setRoundImage;


//-(void)resetGame;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setRoundImage];
    self.roundImageOriginalPosition = self.roundImageView.center;
    self.imageViews = [NSArray arrayWithObjects:self.topLeftImageView, self.topMiddleImageView, self.topRightImageView, self.midLeftImageView, self.midMiddleImageView, self.midRightImageView, self.bottomLeftImageView, self.bottomMiddleImageView, self.bottomRightImageView, nil];
}

-(UIImageView *) findImageViewsUsingPoint:(CGPoint)point {
    UIImageView *pointOnImageView = nil;
    
    for (UIImageView *eachImageView in self.imageViews)
    {
        if(CGRectContainsPoint(eachImageView.frame, point))
        {
            pointOnImageView = eachImageView;
            break;
        }
    }
    return pointOnImageView;
}

-(void)setRoundImage{

}

-(IBAction)onDrag:(UIPanGestureRecognizer *)panGesture {
    CGPoint currentPoint = [sender locationInView:self.view];
    if ([sender state] == UIGestureRecognizerStateEnded){
        UIImageView *targetImageView = [self findImageViewsUsingPoint:currentPoint];
        if (targetImageView && targetImageView.image == nil) {
            targetImageView.image = roundImageView.image;
            }
        gameEngine.ticTurn = !gameEngine.ticTurn;
        [self setRoundImage];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
