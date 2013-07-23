//
//  HomeView.m
//  weibo
//
//  Created by 斌 on 13-7-19.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "HomeView.h"
#import <ShareSDK/ShareSDK.h>
#import "HttpRequest.h"
#import "JSONKit.h"
#import "WeiboCell.h"
#import "TimeInterval.h"
#import "WeiboBodyView.h"
@interface HomeView ()

@end

@implementation HomeView

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
    
    NSString *url_str=@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=";
    NSDictionary *dic=[ShareSDK getCredentialWithType:1].sourceData;
    url_str=[url_str stringByAppendingFormat:@"%@&count=20",[dic objectForKey:@"access_token"]];
    NSString *response=[HttpRequest getUrlWithStr:url_str];
    contentAr=[[response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode]objectForKey:@"statuses"];;
    imageAr=[[NSMutableArray alloc]init];
    for (int count = 0;count < [contentAr count];count++) {
         NSURL *url = [NSURL URLWithString:[[[contentAr objectAtIndex:count]objectForKey:@"user"]objectForKey:@"profile_image_url"]];
        UIImage *img=[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
        [imageAr addObject:img];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"WeiboCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    
    
    NSInteger row=[indexPath row];
    

    
    UIImageView *image=(UIImageView*)[cell viewWithTag:1];
    image.image = [imageAr objectAtIndex:row];

    
    UILabel *name = (UILabel *)[cell viewWithTag:2];
    name.text=[[[contentAr objectAtIndex:row]objectForKey:@"user"]objectForKey:@"screen_name"];
    
    
    UILabel *time = (UILabel *)[cell viewWithTag:3];
    time.text=[TimeInterval intervalSinceNow:[[contentAr objectAtIndex:row]objectForKey:@"created_at"]];

    UITextView *text = (UITextView *)[cell viewWithTag:4];
    text.text=[[contentAr objectAtIndex:row]objectForKey:@"text"];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 137;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
static NSDictionary *selected;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSInteger row=[indexPath row];
    
    
    selected=[[NSDictionary alloc]initWithObjectsAndKeys:
              [imageAr objectAtIndex:row],@"image",
              [[[contentAr objectAtIndex:row]objectForKey:@"user"]objectForKey:@"screen_name"],@"screenName",
              [[[contentAr objectAtIndex:row]objectForKey:@"user"]objectForKey:@"name"],@"name",
              [TimeInterval intervalSinceNow:[[contentAr objectAtIndex:row]objectForKey:@"created_at"]],@"time",
              [[contentAr objectAtIndex:row]objectForKey:@"text"],@"text",
              nil];
    
 
    id WeiboBodyView = segue.destinationViewController;
    [WeiboBodyView setValue:selected forKey:@"dataDic"];
    
}

@end
