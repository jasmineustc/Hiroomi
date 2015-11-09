//
//  ApartmentViewController.m
//  HiRoomi
//
//  Created by mizhang on 8/3/15.
//  Copyright (c) 2015 08723 Team-10. All rights reserved.
//

#import "ApartmentViewController.h"
#import <Parse/Parse.h>


@implementation ApartmentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = [UIImage imageNamed:@"viewApparmentBackground"];
    backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    backgroundImageView.layer.zPosition = -1;
    [self.view addSubview:backgroundImageView];

}

-(void)viewDidAppear:(BOOL)animated
{

    if(![PFUser currentUser]){
        [self performSegueWithIdentifier:@"LoginViewSegue" sender:self];
        
    }

    
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




@end
