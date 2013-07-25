//
//  UserView.h
//  weibo
//
//  Created by 斌 on 13-7-23.
//  Copyright (c) 2013年 斌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserView : UITableViewController{

    IBOutlet UIImageView *image;
    IBOutlet UILabel *screenName;
    IBOutlet UILabel *name;
    IBOutlet UILabel *statusesCount;
    IBOutlet UILabel *friendsCount;
    IBOutlet UILabel *followersCount;
}

@end
