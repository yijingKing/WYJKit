/*******************************************************************************
 Copyright (K), 2019 - ~, ╰莪呮想好好宠Nǐつ
 
 Author:        ╰莪呮想好好宠Nǐつ (Wang Yijing)
 E-mail:        1091676312@qq.com
 GitHub:        https://github.com/MemoryKing
 ********************************************************************************/

#import "WYJFileManager.h"

@implementation WYJFileManager
+(NSString *)yi_saveDocumentsImage:(UIImage *)image imgName:(NSString *)name  {
    
    UIImage *imagesave = image;
    NSString *path_sandox = NSHomeDirectory();
    NSString *imagePath = [NSString stringWithFormat:@"%@/Documents/%@.png",path_sandox,name];
    //把图片直接保存到指定的路径
    [UIImagePNGRepresentation(imagesave) writeToFile:imagePath atomically:YES];
    NSLog(@"%s  %@",__func__,imagePath);
    return imagePath;
}

+(UIImage *)yi_getDocumentImageName:(NSString *)name {
    // 读取沙盒路径图片
    NSString *aPath=[NSString stringWithFormat:@"%@/Documents/%@.png",NSHomeDirectory(),name];
    // 拿到沙盒路径图片
    UIImage *img=[[UIImage alloc]initWithContentsOfFile:aPath];
    //返回该图片
    NSLog(@"%s  %@",__func__,aPath);
    return img;
}

@end
