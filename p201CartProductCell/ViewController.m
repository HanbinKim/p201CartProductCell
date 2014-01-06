//
//  ViewController.m
//  p201CartProductCell
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"
#import "ProductCell.h"
#import "CartDelegate.h"
#define PRODUCT_CELL @"PRODUCT_CELL"
#define CART_CELL @"CART_CELL"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, CartDelegate>{
    NSArray *data;
    NSMutableArray *cart;
}
@property (weak, nonatomic) IBOutlet UITableView *table;


@end

@implementation ViewController

- (void) addItem:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *indexPath = [self.table indexPathForCell:cell];
    Product *item = data[indexPath.row];
    
    [cart addObject:item];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
    [self.table reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(0 == section)
    {
        return [data count];
    }
    else
    {
        return [cart count];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return (0 == section)? @"상품목록" : @"카트";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(0 == indexPath.section)
    {
        ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PRODUCT_CELL" forIndexPath:indexPath];
    
        Product *item = data[indexPath.row];
        [cell setProductInfo:item];
        cell.delegate = self;
        return cell;
    }
    
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CART_CELL" forIndexPath:indexPath];
        
        Product *item = cart[indexPath.row];
        cell.textLabel.text = item.name;
        return cell;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    data = @[[Product product:@"car1" price:@"100" image:@"car1.png"],
             [Product product:@"car2" price:@"200" image:@"car2.png"],
             [Product product:@"car3" price:@"250" image:@"car3.png"],
             [Product product:@"car4" price:@"300" image:@"car4.png"],
             [Product product:@"car5" price:@"999" image:@"car5.png"]];
    
    cart = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
