//
//  YLStatusCell.m
//  A2WeiBo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLStatusCell.h"
@interface YLStatusCell()
@property(nonatomic,weak)UIImageView * iconView;
@property(nonatomic,weak)UILabel *nameLabel;
@property(nonatomic,weak)UILabel *myTextLabel;
@property(nonatomic,weak)UIImageView *pictureView;


@end
@implementation YLStatusCell
+(id)statuCellWithTableView:(UITableView *)tableView
{
    static NSString * cellID=@"statusCell";
   
//    YLStatusCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell=[[YLStatusCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    
//    }
    
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
     [tableView registerClass:[self class]forCellReuseIdentifier:cellID];
    return [tableView dequeueReusableCellWithIdentifier:cellID];
   // return cell;
}
-(UIImageView *)iconView
{
    if (_iconView == nil) {
        UIImageView *imageView=[[UIImageView alloc]init];
        imageView.layer.cornerRadius = 25;
        imageView.layer.masksToBounds = YES;
        _iconView=imageView;
        [self.contentView addSubview:_iconView];
    }
    return _iconView;
}
-(UILabel *)nameLabel
{
    if (_nameLabel == nil) {
        UILabel *label=[[UILabel alloc]init];
        _nameLabel=label;
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}
-(UILabel *)myTextLabel
{
    if (_myTextLabel == nil) {
        UILabel *label=[[UILabel alloc]init];
        label.numberOfLines=0;
        label.lineBreakMode=NSLineBreakByCharWrapping;
        label.font=[UIFont systemFontOfSize:14];
        _myTextLabel=label;
        [self.contentView addSubview:_myTextLabel];
    }
    return _myTextLabel;
}
-(UIImageView *)pictureView
{
    if (_pictureView == nil) {
        UIImageView *imageView=[[UIImageView alloc]init];
        _pictureView=imageView;
        [self.contentView addSubview:_pictureView];
    }
    return _pictureView;
}
-(void)setStatus:(YLStatusModel *)status
{
    _status=status;
    self.iconView.image=[UIImage imageNamed:status.icon];
    self.iconView.frame=status.statusFrame.iconFrame;
    //[self.contentView addSubview:self.iconView];
     self.nameLabel.text=status.name;
    self.nameLabel.frame=status.statusFrame.nameFrame;
    //[self.contentView addSubview:self.nameLabel];
    self.myTextLabel.text=status.text;
    self.myTextLabel.frame=status.statusFrame.textFrame;
    
    self.pictureView.image=[UIImage imageNamed:status.picture];
    self.pictureView.frame=status.statusFrame.pictureFrame;
    self.cellHeight=status.cellHeight;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
    }
    return self;
}
@end
