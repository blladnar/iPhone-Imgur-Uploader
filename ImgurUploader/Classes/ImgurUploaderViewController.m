//
//  ImgurUploaderViewController.m
//  ImgurUploader
//
//  Created by Randall Brown on 2/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImgurUploaderViewController.h"

@implementation ImgurUploaderViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
	uploader = [[ImgurUploader alloc] init];
	uploader.delegate = self;
}

-(IBAction)showCameraPicker:(id)sender
{
	imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
	
	[self presentModalViewController:imagePicker animated:YES];
}

-(IBAction)showLibraryPicker:(id)sender
{
	imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	
	[self presentModalViewController:imagePicker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{		
	[self dismissModalViewControllerAnimated:YES];
	[uploader uploadImage:[info objectForKey:UIImagePickerControllerOriginalImage]];
}


-(void)imageUploadedWithURLString:(NSString*)urlString
{
	urlField.text = urlString;
}

-(void)uploadFailedWithError:(NSError *)error
{
	
}

-(void)uploadProgressedToPercentage:(CGFloat)percentage
{
	progressView.hidden = !( percentage > 0.0 && percentage < 1.0 );
	progressView.progress = percentage;
}



- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
