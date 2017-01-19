//
//  ViewController.h
//  BShipDemo
//
//  Created by api on 1/15/17.
//  Copyright © 2017 api. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *loginIncompleteLabel;
@property (weak, nonatomic) IBOutlet UILabel *loginFailedLabel;
- (IBAction)btnLoginClicked:(id)sender;

@end

