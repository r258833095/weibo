//
//  UserView.m
//  weibo
//
//  Created by 斌 on 13-7-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import "UserView.h"

#import <ShareSDK/ShareSDK.h>
#import "Header.h"
#import "HttpRequest.h"
#import "JSONKit.h"

#import "ImgDownload.h"

@interface UserView ()

@end

@implementation UserView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

   
}

-(void)viewWillAppear:(BOOL)animated{

    
    NSDictionary *dataDic=[[NSDictionary alloc]initWithObjectsAndKeys:
                         [[ShareSDK getCredentialWithType:ShareTypeSinaWeibo].sourceData objectForKey:@"access_token"],@"access_token",
                         [[ShareSDK getCredentialWithType:ShareTypeSinaWeibo].sourceData objectForKey:@"uid"],@"uid",nil];
    
    NSString *response=[HttpRequest getUrlWithResponse:NO serverAddr:SERVER_ADDR_HTTP_SINA datagramKey:SINA_USERS_SHOW datagramDic:dataDic];
    NSDictionary *contentDic=[response objectFromJSONStringWithParseOptions:JKParseOptionLooseUnicode];
    
    image.image=[ImgDownload getUrlStrWithSynchronous:[contentDic objectForKey:@"profile_image_url"]];
    screenName.text=[contentDic objectForKey:@"screen_name"];
    name.text=[NSString stringWithFormat:@"@%@",[contentDic objectForKey:@"name"]];
    statusesCount.text=[NSString stringWithFormat:@"%@",[contentDic objectForKey:@"statuses_count"]];
    friendsCount.text=[NSString stringWithFormat:@"%@",[contentDic objectForKey:@"friends_count"]];
    followersCount.text=[NSString stringWithFormat:@"%@",[contentDic objectForKey:@"followers_count"]];

    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)viewDidUnload {
    image = nil;
    screenName = nil;
    name = nil;
    statusesCount = nil;
    friendsCount = nil;
    followersCount = nil;
    [super viewDidUnload];
}
@end
