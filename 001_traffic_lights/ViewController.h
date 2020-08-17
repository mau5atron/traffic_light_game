//
//  ViewController.h
//  001_traffic_lights
//
//  Created by Gabriel Betancourt on 8/15/20.
//  Copyright © 2020 mau5atron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	NSTimer *timer;
	NSTimer *scoreTimer;
	int timerInt;
	int scoreInt;
}

@property (weak, nonatomic) IBOutlet UIImageView *trafficLight;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;

- (IBAction)startGame:(id)sender;
- (void)startTimer;
- (void)scoreCounter;
@end

