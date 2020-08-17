//
//  ViewController.m
//  001_traffic_lights
//
//  Created by Gabriel Betancourt on 8/15/20.
//  Copyright © 2020 mau5atron. All rights reserved.
//

#import "ViewController.h"
#include <stdio.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	scoreInt = 0;
	self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)startGame:(id)sender {
	// start the game if the score is 0
	
	if ( scoreInt == 0 ){
		timerInt = 3;

		timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimer) userInfo:NULL repeats:TRUE];
		self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
	} else {
		[scoreTimer invalidate];
		[self.startBtn setTitle:@"Restart" forState:UIControlStateNormal];
	}
	
	if ( timerInt == 0 ){ // when timer is 0
		scoreInt = 0;
		timerInt = 3;
	}
}

- (void)startTimer {
	timerInt--;
	NSLog(@"timerInt @ startTimer func %i", timerInt);
	self.startBtn.enabled = FALSE; // disable the start button after starting to avoid restarting game
	switch (timerInt) {
		case 2:
			self.trafficLight.image= [UIImage imageNamed:@"trafficLight3"];
			break;
		case 1:
			self.trafficLight.image = [UIImage imageNamed:@"trafficLight2"];
			break;
		case 0:
			self.trafficLight.image = [UIImage imageNamed:@"trafficLight1"];
			[timer invalidate];
			
			[self.startBtn setTitle:@"Stop" forState:UIControlStateNormal];
			scoreTimer = [NSTimer scheduledTimerWithTimeInterval:0.0001 target:self selector:@selector(scoreCounter) userInfo:NULL repeats:TRUE];
			self.startBtn.enabled = TRUE;
			break;
		default:
			break;
	}
}

- (void)scoreCounter {
	scoreInt++;
	self.scoreLabel.text = [NSString stringWithFormat:@"%i", scoreInt];
}

@end
