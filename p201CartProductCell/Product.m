//
//  Product.m
//  p194StaticCell
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "Product.h"


@implementation Product

+(id)product:(NSString *)name price:(NSString *)price image:(NSString *)image
{
    Product *item = [[Product alloc]init];
    item.name = name;
    item.price = price;
    item.imageName = image;
    return item;
}

@end
