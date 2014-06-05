//
//  ViewController.h
//  Tap Me
//
//  Created by Kevin Moy on 6/4/14.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate> {
    IBOutlet UILabel *scorelabel;
    IBOutlet UILabel *timerlabel;
    NSInteger count;
    NSInteger seconds;
    NSTimer *timer;
}
- (IBAction)buttonPressed;
@end
