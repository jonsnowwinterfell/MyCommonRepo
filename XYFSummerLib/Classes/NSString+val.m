//
//  NSString+val.m
//  ARS
//
//  Created by yafeng xia on 2017/8/9.
//  Copyright © 2017年 liujie. All rights reserved.
//

#import "NSString+val.h"

@implementation NSString (val)
+ (BOOL)phoneValidate:(NSString *)phoneNum{
    
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    
    NSString *mobile = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobile];
    
    return [regextestmobile evaluateWithObject:phoneNum];
    
    
}

//判断是否含有非法字符 yes 有  no没有
+ (BOOL)JudgeTheillegalCharacter:(NSString *)content{
    //提示 标签不能输入特殊字符
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:content]) {
        return YES;
    }
    return NO;
    
}
#pragma 正则匹配用户密码 6 - 16 位数字和字母组合
+ (BOOL)checkPassword:(NSString *)password
{
    NSString *pwdRegex = @"^([a-zA-Z0-9]|[0-9]){6,16}$";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",pwdRegex];
    return [pwdTest evaluateWithObject:password];}


//以字母开头，只能包含“字母”，“数字”，“下划线”，长度6~15
+ (BOOL)passwordValidate:(NSString *)password{
    NSString *pwdRegex = @"^([a-zA-Z]|[a-zA-Z0-9_]|[0-9]){6,16}$";
    NSPredicate *pwdTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",pwdRegex];
    return [pwdTest evaluateWithObject:password];
}
//数字开头，长度7~11
+ (BOOL)studentNumberValidate:(NSString *)number{
    
    NSString *numberRe = @"^[0-9]{6,19}";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",numberRe];
    return [numberTest evaluateWithObject:number];
}
//判断是否为空
+ (BOOL)stringLeng:(NSString *)str{
    
    if (str.length == 0 || str == nil) {
        return NO;
    }
    return YES;
}

+ (BOOL)userNameValidate:(NSString *)name{
    
    NSString *nameRegex = @"^\\w{1,18}$";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",nameRegex];
    return [nameTest evaluateWithObject:name];
}
//身份证号
+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
//邮箱
+ (BOOL)emailValidate:(NSString *)email{
    
    BOOL flag;
    if (email.length <= 0) {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [emailCardPredicate evaluateWithObject:email];
    
    
}


//验证数字小数点
+(BOOL)numValidate:(NSString *)num
{
    BOOL flag;
    if (num.length <= 0) {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^[0-9]+([.]{0}|[.]{1}[0-9]+)$";
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [numPredicate evaluateWithObject:num];
}


//验证数字
+(BOOL)onlyNumValidate:(NSString *)num
{
    BOOL flag;
    if (num.length <= 0) {
        flag = NO;
        return flag;
    }
    
    NSString *regex2 = @"^[0-9]*$";
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [numPredicate evaluateWithObject:num];
}

//验证汉字
+(BOOL)chineseChracterValidate:(NSString *)chracter
{
    BOOL flag;
    if (chracter.length <= 0) {
        flag = NO;
        return flag;
    }
    
    NSString *regex = @"[a-zA-Z\u4e00-\u9fa5][a-zA-Z\u4e00-\u9fa5]+";
    NSPredicate *Predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [Predicate evaluateWithObject:chracter];
}

+ (BOOL)onlyDotTwoNumber:(NSString *)num{
    
    BOOL flag;
    if (num.length <= 0) {
        flag = NO;
        return flag;
    }
    
    NSString *regex = @"^[0-9]+(\\.[0-9]{2})?$";
    NSPredicate *Predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [Predicate evaluateWithObject:num];
    
}


+ (NSString *)stringFromHtml:(NSString*)htm{
    
    return [[self class] filterHTML:htm];
    
}
+ (NSString *)filterHTML:(NSString *)html{
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * charText = nil;
    while([scanner isAtEnd]==NO)
    {
        
        
        [scanner scanUpToString:@"&" intoString:nil];
        [scanner scanUpToString:@";" intoString:&charText];
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@;",charText] withString:@""];
        
    }
    
    html = [[self class] filterMark:html];
    return html;
    
}
+ (NSString *)filterMark:(NSString *)html{
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while ([scanner isAtEnd]==NO) {
        
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
        
    }
    return html;
}
+(int)checkIsHaveNumAndLetter:(NSString*)password{
    //数字条件
    NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //符合数字条件的有几个字节
    NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:password
                                                                       options:NSMatchingReportProgress
                                                                         range:NSMakeRange(0, password.length)];
    
    //英文字条件
    NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
    
    //符合英文字条件的有几个字节
    NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:password options:NSMatchingReportProgress range:NSMakeRange(0, password.length)];
    
    if (tNumMatchCount == password.length) {
        //全部符合数字，表示沒有英文
        return 1;
    } else if (tLetterMatchCount == password.length) {
        //全部符合英文，表示沒有数字
        return 2;
    } else if (tNumMatchCount + tLetterMatchCount == password.length) {
        //符合英文和符合数字条件的相加等于密码长度
        return 3;
    } else {
        return 4;
        //可能包含标点符号的情況，或是包含非英文的文字，这里再依照需求详细判断想呈现的错误
    }
    
}
/// 特殊符号
+(NSString *)specialSymbolsAction{
    //数学符号
    NSString *matSym = @" ﹢﹣×÷±/=≌∽≦≧≒﹤﹥≈≡≠=≤≥<>≮≯∷∶∫∮∝∞∧∨∑∏∪∩∈∵∴⊥∥∠⌒⊙√∟⊿㏒㏑%‰⅟½⅓⅕⅙⅛⅔⅖⅚⅜¾⅗⅝⅞⅘≂≃≄≅≆≇≈≉≊≋≌≍≎≏≐≑≒≓≔≕≖≗≘≙≚≛≜≝≞≟≠≡≢≣≤≥≦≧≨≩⊰⊱⋛⋚∫∬∭∮∯∰∱∲∳%℅‰‱øØπ";
    
    
    NSString *faceSym = @"^ _ ^";
    //标点符号
    NSString *punSym = @"。，、＇：∶；?‘’“”〝〞ˆˇ﹕︰﹔﹖﹑·¨….¸;！´？！～—ˉ｜‖＂〃｀@﹫¡¿﹏﹋﹌︴々﹟#﹩$﹠&﹪%*﹡﹢﹦﹤‐￣¯―﹨ˆ˜﹍﹎+=<＿_-ˇ~﹉﹊（）〈〉‹›﹛﹜『』〖〗［］《》〔〕{}「」【】︵︷︿︹︽_﹁﹃︻︶︸﹀︺︾ˉ﹂﹄︼❝❞!():,'[]｛｝^・.·．•＃＾＊＋＝＼＜＞＆§⋯`－–／—|\"\\";
    
    //单位符号＊·
    NSString *unitSym = @"°′″＄￥〒￠￡％＠℃℉﹩﹪‰﹫㎡㏕㎜㎝㎞㏎m³㎎㎏㏄º○¤%$º¹²³";
    
    //货币符号
    NSString *curSym = @"₽€£Ұ₴$₰¢₤¥₳₲₪₵元₣₱฿¤₡₮₭₩ރ円₢₥₫₦zł﷼₠₧₯₨Kčर₹ƒ₸￠";
    
    //制表符
    NSString *tabSym = @"─ ━│┃╌╍╎╏┄ ┅┆┇┈ ┉┊┋┌┍┎┏┐┑┒┓└ ┕┖┗ ┘┙┚┛├┝┞┟┠┡┢┣ ┤┥┦┧┨┩┪┫┬ ┭ ┮ ┯ ┰ ┱ ┲ ┳ ┴ ┵ ┶ ┷ ┸ ┹ ┺ ┻┼ ┽ ┾ ┿ ╀ ╁ ╂ ╃ ╄ ╅ ╆ ╇ ╈ ╉ ╊ ╋ ╪ ╫ ╬═║╒╓╔ ╕╖╗╘╙╚ ╛╜╝╞╟╠ ╡╢╣╤ ╥ ╦ ╧ ╨ ╩ ╳╔ ╗╝╚ ╬ ═ ╓ ╩ ┠ ┨┯ ┷┏ ┓┗ ┛┳ ⊥ ﹃ ﹄┌ ╮ ╭ ╯╰";
    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@",matSym,punSym,unitSym,curSym,tabSym,faceSym];
}
//正则去除网络标签
+(NSString *)getZZwithString:(NSString *)string{
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n|&nbsp|&middot|&mdash|&lsquo|&quo"
                                                                                    options:0
                                                                                      error:nil];
    string=[regularExpretion stringByReplacingMatchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, string.length) withTemplate:@""];
    return string;
}
@end
