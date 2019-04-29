//
//  SKHTTPError.h
//  EduCare for Parents
//
//  Created by Somer.King on 2018/1/24.
//  Copyright © 2018年 Somer.King. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

/**
 -100    系统内部错误
 51    接口尚未提供
 53    账号类型错误
 55    参数不足或错误，一般为接口必填参数不足或类型错误
 150    未登录或登录超时/token错误
 153    Token 丢失111
 */
//typedef void(^TokenNull)();
@interface SKHTTPError : NSObject

SKInstanceH(Error)

@property (strong, nonatomic) NSString *server_error;
/**
 全局错误信息
 */
@property (strong, nonatomic, readonly) NSDictionary *errors;

/**
 发送验证码信息错误
 */
@property (strong, nonatomic, readonly) NSDictionary *loginAuthCodeErrors;

/**
 注册信息错误
 */
@property (strong, nonatomic, readonly) NSDictionary *loginRegisterErrors;

/**
 登录信息错误
 */
@property (strong, nonatomic, readonly) NSDictionary *loginLoginErrors;

/**
 找回密码信息错误
 */
@property (strong, nonatomic, readonly) NSDictionary *loginFindPwdErrors;

/**
 修改密码信息错误
 */
@property (strong, nonatomic, readonly) NSDictionary *loginChangePwdErrors;

/**
 添加子女信息错误
 */
@property (strong, nonatomic, readonly) NSDictionary *addStudentErrors;

/**
 获取子女信息错误
 */
@property (strong, nonatomic, readonly) NSDictionary *childDetailErrors;

/**
 修改子女信息
 */
@property (strong, nonatomic, readonly) NSDictionary *childResetErrors;

/**
 删除子女
 */
@property (strong, nonatomic, readonly) NSDictionary *childDeleteErrors;

/**
 获得预约设置
 */
@property (strong, nonatomic, readonly) NSDictionary *workGetCalendarErrors;

/**
 添加工作流
 */
@property (strong, nonatomic, readonly) NSDictionary *workAddErrors;

/**
 取消工作流
 */
@property (strong, nonatomic, readonly) NSDictionary *workCancelErrors;

/**
 同意工作流
 */
@property (strong, nonatomic, readonly) NSDictionary *workAgreeErrors;

/**
 拒绝工作流
 */
@property (strong, nonatomic, readonly) NSDictionary *workRejectErrors;

//@property (strong, nonatomic) TokenNull noTokenOccur;

/**
 获取错误信息
 @param code 错误编码
 @return 提示错误
 */
- (NSString *)errorWithCode:(NSString *)code inErrorDictionary:(NSDictionary *)dict;

@end
