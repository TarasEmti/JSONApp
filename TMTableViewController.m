//
//  TMTableViewController.m
//  JSONapp
//
//  Created by Тарас on 23.11.16.
//  Copyright © 2016 Taras Minin. All rights reserved.
//

#import "TMTableViewController.h"

@interface TMTableViewController ()

@property (strong, nonatomic) NSDictionary *cellInfo;
@property (strong, nonatomic) NSArray *cellText;

@end

@implementation TMTableViewController

- (id) initWithInfo:(NSDictionary*) info {
    
    self = [super init];
    _cellInfo = info;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *allKeys = [[NSArray alloc] initWithArray:[_cellInfo allKeys]];
    _cellText = [allKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_cellText count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    NSString *option = [NSString stringWithFormat:@"%@", [_cellText objectAtIndex:indexPath.row]];
    NSString *detail = [NSString stringWithFormat:@"%@", [_cellInfo valueForKey:[_cellText objectAtIndex:indexPath.row]]];
    
    if ([detail hasPrefix:@"{"]) {
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    } else {
    
        NSString *detailClean = [detail stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        cell.detailTextLabel.text = detailClean;
    }
    
    cell.textLabel.text = option;

    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        
        NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:[_cellInfo valueForKey:[_cellText objectAtIndex:indexPath.row]]];
        
        TMTableViewController *newController = [[TMTableViewController alloc] initWithInfo:dict];
        newController.title = selectedCell.textLabel.text;
        
        [self showViewController:newController sender:nil];
    }
}

@end
