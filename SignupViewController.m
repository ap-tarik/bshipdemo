//
//  SignupViewController.m
//  BShipDemo
//
//  Created by api on 1/17/17.
//  Copyright © 2017 api. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)validateButton:(id)sender {
    if ((_emailField.hasText && [self validateEmail:_emailField.text])
        && (_passwordField.hasText && _passwordField.text.length > 8)
        && [_passwordField.text isEqualToString:_password2Field.text] == YES){
        _signupButton.enabled = YES;
    }
    else{
        _signupButton.enabled = NO;
    }
}

- (BOOL) validateEmail: (NSString*)mailtext {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:mailtext];
}

- (IBAction)btnSignupClicked:(id)sender {
    _signupSuccessLabel.hidden = YES;
    _signupFailedLabel.hidden = YES;
    
        if ([self apiSignup] == YES){
            _signupSuccessLabel.hidden = NO;
        }
        else
            _signupFailedLabel.hidden = NO;
}

- (bool)apiSignup;
{
    return YES;
    NSURL *url = [NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    bool *isSuccess = NO;
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             /*NSDictionary *greeting = [NSJSONSerialization JSONObjectWithData:data
              options:0
              error:NULL];
              */__block bool isSuccess = YES;
             //self.greetingId.text = [[greeting objectForKey:@"id"] stringValue];
         }
         else
         {
             __block bool isSuccess = NO;
         }
     }];
    return isSuccess;
}
- (IBAction)emailHintStart:(id)sender {
    _emailHintLabel.hidden = NO;
}
- (IBAction)emailHintEnd:(id)sender {
    _emailHintLabel.hidden = YES;
}

- (IBAction)passwordHintStart:(id)sender {
    _passwordHintLabel.hidden = NO;
}

- (IBAction)passwordHintEnd:(id)sender {
    _passwordHintLabel.hidden = YES;
}
    @end
