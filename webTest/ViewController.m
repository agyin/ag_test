//
//  ViewController.m
//  webTest
//
//  Created by yinaiguo on 13-1-10.
//  Copyright (c) 2013年 yinaiguo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableURLRequest *req  = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://help.apple.com/iphone/5/interface/cache.manifest"]];
    [req setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Mobile/10A403" forHTTPHeaderField:@"User-Agent"];

    NSURLConnection* conn = [NSURLConnection
                             connectionWithRequest:req
                             delegate:self];
	// Do any additional setup after loading the view, typically from a nib.
//    [_webView loadRequest:req];
//    [_webView loadHTMLString:@"<script>document.write(navigator.userAgent);</script>" baseURL:nil];

}
//- (NSURLRequest *)connection:(NSURLConnection *)connection willSendRequest:(NSURLRequest *)request redirectResponse:(NSURLResponse *)response{
//    return nil;
//}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    NSHTTPURLResponse *resp = (NSHTTPURLResponse*)response;
    NSLog(@"reponse:\n%d\n%@\n%@\n"
          , [resp statusCode]
          , [response MIMEType]
          , [resp allHeaderFields]
          );
    if (NSOrderedSame == [[response textEncodingName] caseInsensitiveCompare:@"utf-8"]) {
        _textEncode = NSUTF8StringEncoding;
    }
    else{
        _textEncode = NSASCIIStringEncoding;
    }
    [_data release];
    _data = [[NSMutableData alloc] initWithCapacity:[response expectedContentLength]];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];
}

//- (NSInputStream *)connection:(NSURLConnection *)connection needNewBodyStream:(NSURLRequest *)request{
//    
//}
- (void)connection:(NSURLConnection *)connection   didSendBodyData:(NSInteger)bytesWritten
 totalBytesWritten:(NSInteger)totalBytesWritten
totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite{
    
}

//- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse{
//    
//}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString* strData = [[NSString alloc] initWithData:_data encoding:_textEncode];
    NSLog(@"%@\n", strData);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webView release];
    [super dealloc];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
//    NSString* value = [webView stringByEvaluatingJavaScriptFromString:@" document.getElementsByTagName('html').innerHTML;"];
//    NSLog(@"%@", value);
}
@end
