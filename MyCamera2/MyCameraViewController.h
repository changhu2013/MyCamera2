//
//  MyCameraViewController.h
//  MyCamera2
//
//  Created by changhu on 13-8-9.
//  Copyright (c) 2013年 com.demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCameraViewController : UIViewController <UIActionSheetDelegate> {
    
    IBOutlet UITextField *textField;
    
    IBOutlet UIActivityIndicatorView *activityIndicator;
    
    IBOutlet UIProgressView *press;
    
    NSTimer *timer;
    
}

- (IBAction)touchView:(id)sender;

- (IBAction)editingDidEnd:(id)sender;

- (IBAction)clickBtn:(id)sender;

- (IBAction)clickBtn2:(id)sender;

- (IBAction)clickBtn3:(id)sender;

- (IBAction)clickBtn4:(id)sender;

- (IBAction)clickSegment:(id)sender;


-(void)update;

@end
