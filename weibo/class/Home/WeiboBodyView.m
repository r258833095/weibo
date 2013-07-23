//
//  WeiboBodyView.m
//  weibo
//
//  Created by 斌 on 13-7-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "WeiboBodyView.h"

@interface WeiboBodyView ()

@end

@implementation WeiboBodyView
@synthesize dataDic;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"%@",dataDic);
    image.image=[dataDic objectForKey:@"image"];
    name.text=[dataDic objectForKey:@"name"];
    screenName.text=[dataDic objectForKey:@"screenName"];
    text.text=[dataDic objectForKey:@"text"];
    time.text=[dataDic objectForKey:@"time"];
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    image = nil;
    name = nil;
    screenName = nil;
    text = nil;
    time = nil;
    [super viewDidUnload];
}
@end
