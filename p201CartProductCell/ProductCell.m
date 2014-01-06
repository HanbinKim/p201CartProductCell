//
//  ProductCell.m
//  p194StaticCell
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ProductCell.h"

@interface ProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productPrice;

@end


@implementation ProductCell




- (void)setProductInfo:(Product *)item
{
    self.productName.text=item.name;
    self.productPrice.text=item.price;
    self.productImage.image=[UIImage imageNamed:item.imageName];
}

- (IBAction)addCart:(id)sender
{
    [self.delegate addItem:self];
}


@end
