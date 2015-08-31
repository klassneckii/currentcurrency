//
//  BestRatesTableViewController.m
//  CurrentCurrency
//
//  Created by Dmitrii on 31.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "BestRatesTableViewController.h"

#import "KLCurrencyAPI.h"

#import "KLRate.h"

#import "CurrencyConstants.h"


static NSString *cellIdentifier = @"RateCell";

@interface BestRatesTableViewController ()

@property (nonatomic, strong) NSMutableArray *rates;

@end

@implementation BestRatesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    KLCurrencyAPI *api = [KLCurrencyAPI new];
    [api fetchTodayRussianRatesWithCompletitionBlock:^(NSArray *rates, NSError *error) {
        if (error) {
            return;
        }
        self.rates = [NSMutableArray arrayWithArray:rates];
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rates.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    KLRate *rate = self.rates[indexPath.row];
    
    
    NSString *currency;
    if ([rate.destinationCurrency isEqualToString:kAECurrencyEUR]) {
        currency = @"EUR";
    } else if ([rate.destinationCurrency isEqualToString:kAECurrencyUSD]) {
        currency = @"USD";
    } else {
        currency = @"hz";
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ | %@", rate.bank.name, currency];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Продать: %.2f, Купить: %.2f", rate.sellRate, rate.buyRate];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
