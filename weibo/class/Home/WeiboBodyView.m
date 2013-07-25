//
//  WeiboBodyView.m
//  weibo
//
//  Created by 斌 on 13-7-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "WeiboBodyView.h"
#import "STTweetLabel.h"
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

    image.image=[dataDic objectForKey:@"image"];
    name.text=[dataDic objectForKey:@"name"];
    screenName.text=[dataDic objectForKey:@"screenName"];
    time.text=[dataDic objectForKey:@"time"];
    
    
    UIFont *theFont =[UIFont systemFontOfSize:15];
    CGSize feelSize = [[dataDic objectForKey:@"text"] sizeWithFont:theFont constrainedToSize:CGSizeMake(280.0,0)];
    float  feelHeight = feelSize.height;
    STTweetLabel *_tweetLabel = [[STTweetLabel alloc] initWithFrame:CGRectMake(20.0, 63.0, 280.0, feelHeight)];
    [_tweetLabel setFont:theFont];
    [_tweetLabel setTextColor:[UIColor blackColor]];
    [_tweetLabel setText:[dataDic objectForKey:@"text"]];
    
    STLinkCallbackBlock callbackBlock = ^(STLinkActionType actionType, NSString *link) {
        
        NSString *displayString = NULL;
        
        switch (actionType) {
                
            case STLinkActionTypeAccount:
                displayString = [NSString stringWithFormat:@"Twitter account:\n%@", link];
                break;
                
            case STLinkActionTypeHashtag:
                displayString = [NSString stringWithFormat:@"Twitter hashtag:\n%@", link];
                break;
                
            case STLinkActionTypeWebsite:
                displayString = [NSString stringWithFormat:@"Website:\n%@", link];
                break;
        }
        
        NSLog(@"%@",displayString);
        
    };
    
    [_tweetLabel setCallbackBlock:callbackBlock];
    
    [self.view addSubview:_tweetLabel];
    
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
    time = nil;
    [super viewDidUnload];
}
@end
