//
//  SignupViewController.h
//  BShipDemo
//
//  Created by api on 1/17/17.
//  Copyright © 2017 api. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *password2Field;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UILabel *signupFailedLabel;
@property (weak, nonatomic) IBOutlet UILabel *signupSuccessLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailHintLabel;
@property (weak, nonatomic) IBOutlet UILabel *passwordHintLabel;

- (IBAction)passwordHintStart:(id)sender;
- (IBAction)passwordHintEnd:(id)sender;
- (IBAction)emailHintStart:(id)sender;
- (IBAction)emailHintEnd:(id)sender;

- (IBAction)validateButton:(id)sender;
- (BOOL) validateEmail: (NSString*)mailtext ;

- (IBAction)btnSignupClicked:(id)sender;
@end
