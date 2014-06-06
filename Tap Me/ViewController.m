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
    // Returns a file name and type
- (AVAudioPlayer *)setupAudioPlayerWithfile:(NSString *)file type:(NSString *)type
{
    // mainBundle tells where in project to look, Audio player needs to know path in URl, full path converted to URL format
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    // Store error if something goes wrong
    NSError *error;
    
    // Calls audio player
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    
    // Error logged in console if something goes wrong
    if (!audioPlayer) {
        NSLog(@"%@",[error description]);
    }

    //Everything works, returns audio player
    return audioPlayer;

}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Changes background color can be an image you have
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    scorelabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timerlabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    
       //Sound
    buttonBeep = [self setupAudioPlayerWithfile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithfile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithfile:@"HallOfTheMountainKing" type:@"mp3"];
    
    [self setupGame]; // Runs game as soon as app opens.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)subtractTime {
    seconds--;
    timerlabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    [secondBeep play];
    if (seconds == 0) { //Sends out alert message at end of game
        [timer invalidate];
        // UIAlertView: Title, message, one or more buttons.
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No more time"
        message:[NSString stringWithFormat:@"You pressed it %i times", count]
        delegate:self
        cancelButtonTitle:@"Play again"
        otherButtonTitles:nil];
        
        [alert show];
    }
}
- (void)setupGame {
    seconds = 30;
    count = 0;
    
    timerlabel.text = [NSString stringWithFormat:@"Time: %i", seconds];
    scorelabel.text = [NSString stringWithFormat:@"Score\n%i", count];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                target:self //Want message to go to view controller which is here
                            selector:@selector(subtractTime) //What method to call
                                            userInfo:nil
                        repeats:YES]; //Want timer to go off every more than once
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
}
- (IBAction)buttonPressed {
    count++;
    scorelabel.text = [NSString stringWithFormat:@"Score\n%i", count];
    
    //Plays sound
    [buttonBeep play];
}
// Delegates message to view controller
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger) buttonIndex {
    [self setupGame];
}

@end
