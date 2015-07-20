//
//  YLStatusModel.h
//  A2WeiBo
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 yili. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@class YLStatusFrame;
@interface YLStatusModel : NSObject

@property (nonatomic,copy)NSString *picture;

@property (nonatomic,copy)NSString *text;

@property (nonatomic,copy)NSString *icon;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,assign)BOOL vip;

@property(nonatomic,strong)YLStatusFrame *statusFrame;

@property(nonatomic,assign)CGFloat cellHeight;
+(id)statusWithDic:(NSDictionary *)dic;
-(id)initWithDic:(NSDictionary *)dic;
@end

@interface YLStatusFrame : NSObject

@property(nonatomic,assign)CGRect iconFrame;
@property(nonatomic,assign)CGRect nameFrame;
@property(nonatomic,assign)CGRect textFrame;
@property(nonatomic,assign)CGRect pictureFrame;
+(id)statusFrameWithStatusModels:(YLStatusModel *)status;
-(id)initWithStatusModels:(YLStatusModel *)status;

@end
