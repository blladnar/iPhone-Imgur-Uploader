//
//  ImgurUploaderViewController.h
//  ImgurUploader
//
//  Created by Randall Brown on 2/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgurUploader.h"

@interface ImgurUploaderViewController : UIViewController <ImgurUploaderDelegate>
{
	ImgurUploader *uploader;
	IBOutlet UIImagePickerController *imagePicker;
	IBOutlet UITextField *urlField;
	IBOutlet UIProgressView *progressView;
}

-(IBAction)showLibraryPicker:(id)sender;
-(IBAction)showCameraPicker:(id)sender;

@end

