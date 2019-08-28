//
//  YJFileManager.m
//  YJKitDemo
//
//  Created by 祎 on 2019/8/28.
//  Copyright © 2019 Eugene King. All rights reserved.
//

#import "YJFileManager.h"

@implementation YJFileManager
+(NSString *)saveDocumentsImage:(UIImage *)image imgName:(NSString *)name  {
    
    UIImage *imagesave = image;
    NSString *path_sandox = NSHomeDirectory();
    NSString *imagePath = [NSString stringWithFormat:@"%@/Documents/%@.png",path_sandox,name];
    //把图片直接保存到指定的路径
    [UIImagePNGRepresentation(imagesave) writeToFile:imagePath atomically:YES];
    NSLog(@"%s  %@",__func__,imagePath);
    return imagePath;
}

+(UIImage *)getDocumentImageName:(NSString *)name {
    // 读取沙盒路径图片
    NSString *aPath=[NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),name];
    // 拿到沙盒路径图片
    UIImage *img=[[UIImage alloc]initWithContentsOfFile:aPath];
    //返回该图片
    NSLog(@"%s  %@",__func__,aPath);
    return img;
}

@end
