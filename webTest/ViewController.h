//
//  ViewController.h
//  webTest
//
//  Created by yinaiguo on 13-1-10.
//  Copyright (c) 2013年 yinaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSMutableData* _data;
    NSStringEncoding _textEncode;
}
@property (retain, nonatomic) IBOutlet UIWebView *webView;

@end

//change test