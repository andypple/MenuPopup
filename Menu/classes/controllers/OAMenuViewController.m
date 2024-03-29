//
//  OAMenuViewController.m
//  Menu
//
//  Created by Phat, Le Tan on 7/15/14.
//  Copyright (c) 2014 FourFi. All rights reserved.
//

#import "OAMenuViewController.h"
#import "OAArrayDataSource.h"
#import "OAMenuTableViewCell.h"

static NSInteger cell_width = 320;

@interface OAMenuViewController ()<UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) NSArray *menuItems;
@property (strong, nonatomic) OAArrayDataSource *arrayDataSource;

@end

@implementation OAMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _menuItems = @[ @"Profile",
                        @"Explore",
                        @"Favorites",
                        @"Search",
                        @"Inbox",
                        @"Sessions",
                        @"Misc"
                       ];
    }
    return self;
}

- (OAArrayDataSource *)arrayDataSource
{
    if (!_arrayDataSource) {
        TableViewCellConfigureBlock configureCell = ^(OAMenuTableViewCell *cell, id item)
        {
            cell.itemLabel.text = item;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.selectionView.hidden = ![item isEqualToString:@"Explore"];
        };

        IdentifierParserBlock identifierParserBlock = ^NSString *(id item)
        {
            return NSStringFromClass([OAMenuTableViewCell class]);
        };

        _arrayDataSource = [[OAArrayDataSource alloc] initWithItems:self.menuItems identifierParserBlock:identifierParserBlock configureCellBlock:configureCell];
    }
    return _arrayDataSource;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.menuTableView registerNib:[OAMenuTableViewCell nib] forCellReuseIdentifier:NSStringFromClass([OAMenuTableViewCell class])];
    self.menuTableView.tableFooterView = [[UIView alloc] init];
    self.menuTableView.dataSource = self.arrayDataSource;
    self.menuTableView.delegate = self;
    self.menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setLeft:cell_width];

    [UIView beginAnimations:@"Floating" context:NULL];
    [UIView setAnimationDuration:(indexPath.row / 2.0)];
    [cell setLeft:0];
    [UIView commitAnimations];
}

@end
