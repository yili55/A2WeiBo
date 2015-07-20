//
//  YLStatusCell.h
//  A2WeiBo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLStatusModel.h"
@interface YLStatusCell : UITableViewCell
@property(nonatomic,strong)YLStatusModel *status;
@property(nonatomic,assign)CGFloat cellHeight;

+(id)statuCellWithTableView:(UITableView *)tableView;

@end
