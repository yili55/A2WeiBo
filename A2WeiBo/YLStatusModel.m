//
//  YLStatusModel.m
//  A2WeiBo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import "YLStatusModel.h"
#define textPAdding 5
@implementation YLStatusModel
-(id)initWithDic:(NSDictionary *)dic
{
    if (self =[super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
        self.statusFrame=[YLStatusFrame statusFrameWithStatusModels:self];
        self.cellHeight=CGRectGetMaxY(self.statusFrame.pictureFrame) ;
    }
    return self;
}
+(id)statusWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}
-(NSString *)description
{
    
    return [NSString stringWithFormat:@"name=%@,text=%@",self.name,self.text];
}
  @end


@implementation YLStatusFrame

+(id)statusFrameWithStatusModels:(YLStatusModel *)status
{
    return [[self alloc]initWithStatusModels:status];
}
-(id)initWithStatusModels:(YLStatusModel *)status
{
    if (self =[super init]) {
        CGRect mainBounds=[UIScreen mainScreen].bounds;
        
        //设置头像的frame
        CGFloat iconViewX=textPAdding;
        CGFloat iconViewY=textPAdding;
        CGFloat iconViewW=50;
        CGFloat iconViewH=50;
        self.iconFrame=CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
        
        //设置名字的frame
        
        CGFloat nameX=textPAdding+iconViewX+iconViewW;
        CGFloat nameH=30;
        CGFloat nameY=(iconViewH-nameH)*0.5+textPAdding;
        CGFloat nameW=mainBounds.size.width-nameX;
        self.nameFrame=CGRectMake(nameX, nameY, nameW, nameH);
        
        //设置文字
        
        CGFloat textX=textPAdding;
        CGFloat textY=CGRectGetMaxY(self.iconFrame);
        CGFloat textW=mainBounds.size.width-textX*2;
        
        CGSize size=CGSizeMake(textW, CGFLOAT_MAX);
         size=[status.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:14]} context:nil].size;
       CGFloat textH=size.height;
        self.textFrame=CGRectMake(textX, textY, textW, textH);
        
        //设置图片frame
        CGFloat pictureX=textPAdding;
        CGFloat pictureY=CGRectGetMaxY(self.textFrame);
        CGFloat pictureW=80;
        CGFloat pictureH=80;
        if (status.picture) {
            
            
        }else
        {
            pictureW=0;
            pictureH=0;
        }
        
        self.pictureFrame=CGRectMake(pictureX, pictureY, pictureW, pictureH);

        
    }
    return self;
}
@end