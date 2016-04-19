//
//  SKNewsViewController.m
//  Noticeboard
//
//  Created by Shengkun Xie on 18/04/16.
//  Copyright © 2016 TIME LIMITED. All rights reserved.
//

#import "SKNewsViewController.h"

@implementation SKNewsViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@--------%zd",[self class],indexPath.row];
    
    return cell;
}

@end
