//
//  LoginViewController.m
//  HiRoomi
//
//  Created by mizhang on 8/3/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>



@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = [UIImage imageNamed:@"LoginViewBackground"];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    backgroundImageView.layer.zPosition = -1;
    [self.view addSubview:backgroundImageView];

    
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

- (IBAction)facebookLoginPress:(id)sender {
  

    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [indicator setTintColor:[UIColor blackColor]];
    [indicator startAnimating];
    [self.view addSubview:indicator];
    
    // Set permissions required from the facebook user account, you can find more about facebook permissions here https://developers.facebook.com/docs/facebook-login/permissions/v2.0
    NSArray *permissionsArray = @[ @"user_about_me",@"email"];
    
//    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser * user, NSError *error) {
//        
//    }];
    
    // Login PFUser using Facebook

    
//    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error){
//        
//        [indicator stopAnimating];
//        [indicator removeFromSuperview];
    
//        if (!user) {
//            NSString *errorMessage = nil;
//            if (!error) {
//                NSLog(@"Uh oh. The user cancelled the Facebook login.");
//                errorMessage = @"Uh oh. The user cancelled the Facebook login.";
//            } else {
//                NSLog(@"Uh oh. An error occurred: %@", error);
//                errorMessage = [error localizedDescription];
//            }
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Log In Error"
//                                                            message:errorMessage
//                                                           delegate:nil
//                                                  cancelButtonTitle:nil
//                                                  otherButtonTitles:@"Dismiss", nil];
//            [alert show];
//        } else {
//
//            NSLog(@"User with facebook signed up and logged in!");
//            FBRequest *request = [FBRequest requestForMe];
//            // Send request to Facebook
//            [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                // handle response
//                if(!error){
//                    
//                    NSDictionary *userData = (NSDictionary *)result;
//                    
//                    NSLog(@"%@", userData);
//                    
//                    //user[@"fullName"]=  [userData[@"first_name"]  stringByAppendingString: userData[@"last_name"] ];
//                    user[@"fullName"]=  userData[@"name"];
//                    user.email=userData[@"email"];
//                    user.username=userData[@"email"];
//                    user[@"facebookId"]=userData[@"id"];
//                    
//                    [user saveEventually];
//                    // [self performSegueWithIdentifier:@"logIn" sender:nil];
//                }
//            }];
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }
//    }];
 
}

@end









