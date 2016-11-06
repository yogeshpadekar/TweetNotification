//
//  ViewController.m
//  TweetNotification
//
//  Created by Yogesh on 03/11/16.
//  Copyright © 2016 Yogesh Padekar. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//documentation files (the "Software"), to deal in the Software without restriction, including without
//limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
//Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all copies or substantial
//portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
//LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
//EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
//AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
//OR OTHER DEALINGS IN THE SOFTWARE.

#import "SearchViewController.h"
#import <DataAccess/DataAccess.h>
#import "AppDelegate.h"
#import <Social/Social.h>

#define CellIdentifier @"Cell"

@interface SearchViewController ()<UISearchBarDelegate, UITableViewDataSource> {
    IBOutlet UISearchBar *srchbarTweet;
    IBOutlet UITableView *tblTweets;
    NSArray *arrTweets;
}

///Method to present an alert taking Message, Cancel title and UIAlertAction array as parameters
- (void)presentAlertWithMessage:(NSString*)strMessage cancelTitle:(NSString*)strCancelTitle andActions:
(NSArray*)arrActions;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //table view settings
    tblTweets.rowHeight = UITableViewAutomaticDimension;
    tblTweets.estimatedRowHeight = 100.0;
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

///Method to present an alert taking Message, Cancel title and UIAlertAction array as parameters
- (void)presentAlertWithMessage:(NSString*)strMessage cancelTitle:(NSString*)strCancelTitle andActions:
(NSArray*)arrActions {
    UIAlertController *alt = [UIAlertController alertControllerWithTitle:[[[NSBundle mainBundle] infoDictionary]
                                                                          objectForKey:(NSString *)kCFBundleNameKey]
                                                                           message:strMessage
                                                                    preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(strCancelTitle, @"Cancel action")
                               style:UIAlertActionStyleCancel
                               handler:nil];
    [alt addAction:okAction];
    
    for(UIAlertAction *action in arrActions) {
        [alt addAction:action];
    }
    
    [self presentViewController:alt animated:YES completion:nil];
}


#pragma mark - Search bar delegate methods

///Method to call Search functionality
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    if(searchBar.text.length > 0) {
        
        //If there is no twitter account configured then ask user to do so
        if(![DataAccess twitterAccountConfigured]) {
            
            UIAlertAction *goToTwitterSettingsAction = [UIAlertAction
                                                        actionWithTitle:NSLocalizedString
                                                        (@"Go to TweetNotification settings", @"Go to twitter action")
                                                        style:UIAlertActionStyleDefault
                                                        handler:^(UIAlertAction * _Nonnull action) {
                                                            
                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                [[UIApplication sharedApplication] openURL:
                                                                 [NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                                            });
                                                            
                                                        }];
            [self presentAlertWithMessage:@"Please configure twitter account (Settings -> Twitter) to start using the app"
                              cancelTitle:@"Cancel" andActions:[NSArray arrayWithObject:
                                                                goToTwitterSettingsAction]];
            goToTwitterSettingsAction = nil;
            return;
        }
        
        //If twitter account is configured then search for the given hashtag
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [DataAccess loadHashtagQueryForHashTag:searchBar.text withCallback:^(NSArray *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [DataAccess makeLastTweetIdEmpty];
                app.strHashtag = searchBar.text;
                if(error) {
                    [self presentAlertWithMessage:@"Error while fetching tweets" cancelTitle:@"OK" andActions:nil];
                } else {
                    
                    arrTweets = response[1];
                    [tblTweets reloadData];
                }
                [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            });
        }];
        
    }
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
    //Cells with alternate background colors
    cell.contentView.backgroundColor = (indexPath.row % 2) ? [UIColor whiteColor] :
    [UIColor colorWithRed:150/255.0 green:1.0 blue:1.0 alpha:0.3];

    Statuses *objStatus = arrTweets[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@: %@", objStatus.user.name ,objStatus.text];    
    return cell;
}

@end
