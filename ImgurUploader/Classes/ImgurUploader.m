//
//  ThoughtSender.m
//  ThoughtBackDesktop
//
//  Created by Randall Brown on 11/6/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ImgurUploader.h"
#import "NSString+URLEscape.h"
#import "NSData+Base64.h"


@implementation ImgurUploader

@synthesize delegate;

-(void)uploadImage:(UIImage*)image
{
	imageURL = [NSString string];
	
	NSData   *imageData  = UIImageJPEGRepresentation(image, 1.0);
	NSString *imageB64   = [imageData base64EncodingWithLineLength:0];  
	
	imageB64 = [imageB64 stringByEscapingValidURLCharacters];
	
	NSString *uploadCall = [NSString stringWithFormat:@"key=%@&image=%@",@"YOUR_API_KEY_HERE",imageB64];
	
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://api.imgur.com/2/upload"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:[NSString stringWithFormat:@"%d",[uploadCall length]] forHTTPHeaderField:@"Content-length"];
	[request setHTTPBody:[uploadCall dataUsingEncoding:NSUTF8StringEncoding]];
	
	NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:request delegate:self];
	if (theConnection) 
	{
		receivedData=[[NSMutableData data] retain];
	} 
	else 
	{

	}
}

-(void)dealloc
{
	[super dealloc];
	[imageURL release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSString *dataString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
	NSLog( @"%@", dataString );
	
	NSXMLParser* parser = [[NSXMLParser alloc] initWithData:receivedData];
	[parser setDelegate:self];
	[parser parse];
}

-(void)parserDidEndDocument:(NSXMLParser*)parser
{
	[delegate imageUploadedWithURLString:imageURL];
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	currentNode = elementName;
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	if( [currentNode isEqualToString:elementName] )
	{
		currentNode = @"";
	}
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if( [currentNode isEqualToString:@"original"] )
	{
		imageURL = [string retain];
	}
}

@end
