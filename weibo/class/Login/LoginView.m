//
//  LoginView.m
//  weibo
//
//  Created by 斌 on 13-7-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "LoginView.h"
#import <ShareSDK/ShareSDK.h>
@interface LoginView ()

@end

@implementation LoginView

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
    
    //取消授权
    //    [ShareSDK cancelAuthWithType:ShareTypeSinaWeibo];
    //    [ShareSDK cancelAuthWithType:ShareTypeTencentWeibo];
    
    
    //SSO登陆
    [ShareSDK ssoEnabled:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    
    
    int weiboType =[sender tag];
    
    if ([ShareSDK getCredentialWithType:weiboType].sourceData) {

        [self performSegueWithIdentifier:@"login" sender:self];
        
    }else{

    id<ISSAuthOptions> authOptions=[ShareSDK authOptionsWithAutoAuth:YES
                                                       allowCallback:NO
                                                       authViewStyle:SSAuthViewStylePopup
                                                        viewDelegate:nil
                                             authManagerViewDelegate:nil];
    
    [ShareSDK getUserInfoWithType:weiboType
                     authOptions :authOptions
                           result:^(BOOL result, id<ISSUserInfo> userInfo, id<ICMErrorInfo> error) {
                               if (result)
                               {
                                   NSLog(@"成功 %@ ",[ShareSDK getCredentialWithType:weiboType].sourceData);
                                   [self performSegueWithIdentifier:@"login" sender:self];
                               }
                               else
                               {
                                   NSLog(@"失败");
                               }
                           }];
    
    }
    
    
}
@end
