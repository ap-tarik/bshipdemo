//
//  ViewController.m
//  BShipDemo
//
//  Created by api on 1/15/17.
//  Copyright © 2017 api. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnLoginClicked:(id)sender {
    
    _loginIncompleteLabel.hidden = YES;
    _loginFailedLabel.hidden = YES;
    
    if ((_passwordField.hasText && _passwordField.text.length > 8)
        && (_emailField.hasText && [self validateEmail:_emailField.text])){
        if ([self apiLogin] == YES){
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            HomeViewController *viewHome = (HomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"storyboardHomeView"];

            [self.navigationController pushViewController:viewHome animated:YES];
        }
        else
            _loginFailedLabel.hidden = NO;
    }
    else
        _loginIncompleteLabel.hidden = NO;
}

- (BOOL) validateEmail: (NSString*)mailtext {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:mailtext];
}
- (bool)apiLogin;
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
@end
