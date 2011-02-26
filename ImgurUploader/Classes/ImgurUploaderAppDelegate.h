//
//  ImgurUploaderAppDelegate.h
//  ImgurUploader
//
//  Created by Randall Brown on 2/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImgurUploaderViewController;

@interface ImgurUploaderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ImgurUploaderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ImgurUploaderViewController *viewController;

@end

