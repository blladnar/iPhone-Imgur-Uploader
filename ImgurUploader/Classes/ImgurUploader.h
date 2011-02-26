//
//  ThoughtSender.h
//  ThoughtBackDesktop
//
//  Created by Randall Brown on 11/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

@protocol ImgurUploaderDelegate

-(void)imageUploadedWithURLString:(NSString*)urlString;

@end


@interface ImgurUploader : NSObject <NSXMLParserDelegate>
{
	NSObject <ImgurUploaderDelegate> *delegate;
	NSMutableData *receivedData;
	NSString* imageURL;
	NSString* currentNode;
}

-(void)uploadImage:(UIImage*)image;

@property (assign) NSObject <ImgurUploaderDelegate> *delegate;


@end
