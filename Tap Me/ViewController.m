//
//  ViewController.m
//  Tap Me
//
//  Created by Kevin Moy on 6/4/14.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)subtractTime {
    seconds--;
    timerlabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    
    if (seconds == 0) {
        [timer invalidate];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No more time"
        message:[NSString stringWithFormat:@"You pressed it %i times", count]
        delegate:self
        cancelButtonTitle:@"Play again"
        otherButtonTitles:nil];
        
        [alert show];
    }
}
- (void)setupGame {
    seconds = 10;
    count = 0;
    
    timerlabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    scorelabel.text = [NSString stringWithFormat:@"Score\n%i", count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                target:self
                                            selector:@selector(subtractTime)
                                            userInfo:nil
                                            repeats:YES];
}
- (IBAction)buttonPressed {
    count++;
    scorelabel.text = [NSString stringWithFormat:@"Score\n%i", count];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}

@end
