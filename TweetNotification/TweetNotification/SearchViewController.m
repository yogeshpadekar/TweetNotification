//
//  ViewController.m
//  TweetNotification
//
//  Created by Yogesh on 03/11/16.
//  Copyright © 2016 Yogesh. All rights reserved.
//

#import "SearchViewController.h"
#import <DataAccess/DataAccess.h>
#import "AppDelegate.h"

#define CellIdentifier @"Cell"

@interface SearchViewController ()<UISearchBarDelegate, UITableViewDataSource> {
    IBOutlet UISearchBar *srchbarTweet;
    NSString *strAccessToken;
    IBOutlet UITableView *tblTweets;
    NSArray *arrTweets;
}
- (void)presentOKAlertWithMessage:(NSString*)strMessage;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tblTweets.rowHeight = UITableViewAutomaticDimension;
    tblTweets.estimatedRowHeight = 60.0;
    UIImageView *imgviwBackground = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"SearchBackground"]];
    imgviwBackground.contentMode = UIViewContentModeCenter;
    imgviwBackground.backgroundColor = [UIColor colorWithRed:227/255.0 green:1.0 blue:1.0 alpha:1.0];
    tblTweets.backgroundView = imgviwBackground;
    imgviwBackground = nil;
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - User defined methods
- (void)presentOKAlertWithMessage:(NSString*)strMessage {
    UIAlertController *alt = [UIAlertController alertControllerWithTitle:[[NSBundle mainBundle]
                                                                          objectForInfoDictionaryKey:
                                                                          @"CFBundleDisplayName"]
                                                                           message:strAccessToken
                                                                    preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleCancel
                               handler:nil];
    [alt addAction:okAction];
    [self presentViewController:alt animated:YES completion:nil];
}


#pragma mark - Search bar delegate methods
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    if(searchBar.text.length > 0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [DataAccess loadHashtagQueryForHashTag:searchBar.text withCallback:^(NSArray *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [DataAccess makeLastTweetIdEmpty];
                app.strHashtag = searchBar.text;
                if(error) {
                    [self presentOKAlertWithMessage:@"Error while fetching tweets"];
                } else {
                    
                    arrTweets = response[1];
                    [tblTweets reloadData];
                }
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            });
        }];
        
    }
}

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    return YES;
}

#pragma mark - UITableView datasource methods
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [srchbarTweet resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return arrTweets.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.image = [UIImage imageNamed:@"TweetIcon"];
    }
    
    cell.contentView.backgroundColor = (indexPath.row % 2) ? [UIColor whiteColor] :
    [UIColor colorWithRed:85/255.0 green:172/255.0 blue:238/255.0 alpha:0.3];

    Statuses *objStatus = arrTweets[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", objStatus.user.name ,objStatus.text];    
    return cell;
}

@end
