//
//  NSString+val.h
//  ARS
//
//  Created by yafeng xia on 2017/8/9.
//  Copyright © 2017年 liujie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (val)
//手机号是否有效
+ (BOOL)phoneValidate:(NSString *)phoneNum;
//密码是否有效
+ (BOOL)passwordValidate:(NSString *)password;
//学号是否有效
+ (BOOL)studentNumberValidate:(NSString *)number;
//判断是否为空
+ (BOOL)stringLeng:(NSString *)str;
//判断姓名的输入正确性
+ (BOOL)userNameValidate:(NSString *)name;
//身份证号
+ (BOOL)validateIdentityCard: (NSString *)identityCard;
//邮箱
+ (BOOL)emailValidate:(NSString *)email;
+ (NSString *)stringFromHtml:(NSString*)htm;
//金额只能是数字和小数点
+(BOOL)numValidate:(NSString *)num;
+(BOOL)chineseChracterValidate:(NSString *)chracter;
+ (BOOL)onlyDotTwoNumber:(NSString *)num;
//验证数字
+(BOOL)onlyNumValidate:(NSString *)num;
//密码判断
+(int)checkIsHaveNumAndLetter:(NSString*)password;
//禁止输入特殊字符
+(NSString *)specialSymbolsAction;
//判断是否含有非法字符 yes 有  no没有
+ (BOOL)JudgeTheillegalCharacter:(NSString *)content;
//判断密码格式是否正确 6~16位数字子母
+(BOOL)checkPassword:(NSString *) password;

//正则去除网络标签
+(NSString *)getZZwithString:(NSString *)string;
@end
