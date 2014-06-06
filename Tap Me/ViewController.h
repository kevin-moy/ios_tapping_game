//
//  ViewController.h
//  Tap Me
//
//  Created by Kevin Moy on 6/4/14.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
// AlertViewDelegate for alerts
@interface ViewController : UIViewController<UIAlertViewDelegate> {
    IBOutlet UILabel *scorelabel;
    IBOutlet UILabel *timerlabel;
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
    
    //Add Audio Objects for sound
    AVAudioPlayer *buttonBeep;
    AVAudioPlayer *secondBeep;
    AVAudioPlayer *backgroundMusic;

}
- (IBAction)buttonPressed;
@end
