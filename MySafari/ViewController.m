//
//  ViewController.m
//  MySafari
//
//  Created by Steve Toosevich on 3/12/14.
//  Copyright (c) 2014 Steve Toosevich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UIWebViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *myWebView;

@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *forwadButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Retrieve the value of myURLTextField
	NSString *string = @"http://cnn.com";
    //create an NSURL using string value
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.myWebView loadRequest:request];
    
    
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    	NSString *string = textField.text;
    NSURL *myURL;
    if ([string hasPrefix:@"http://"])
    
        myURL = [NSURL URLWithString:string];
    else
        myURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@",string]];
    
      NSURLRequest *request = [NSURLRequest requestWithURL:myURL];

       [self.myWebView loadRequest:request];
 return YES;
    }



        
 
    
//    //Retrieve the value of myURLTextField
//	NSString *string = textField.text;
//    //create an NSURL using string value
//    NSURL *url = [NSURL URLWithString:string];
 //   NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
 //   [self.myWebView loadRequest:request];


- (IBAction)onBackButtonPressed:(id)sender
{
    [self.myWebView goBack];
    
}

- (IBAction)onForwardButtonPressed:(id)sender
{
    [self.myWebView goForward];
    
    
}

- (IBAction)onStopLoadingButtonPressed:(id)sender
{
    [self.myWebView stopLoading];
}

- (IBAction)onReloadButtonPressed:(id)sender
{
    [self.myWebView reload];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    if (self.myWebView.canGoBack == NO)
        
    {
  //      NSLog(@"returned yes" );
        self.backButton.enabled = NO;
        
    }else{
        self.backButton.enabled = YES;
    }
    if (self.myWebView.canGoForward == NO)
    {
        self.forwadButton.enabled = NO;
        
    } else
    {
        self.forwadButton.enabled = YES;
    }
}


@end
