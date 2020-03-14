//
//  ZHProtocol.h
//  ZHBaseKit
//
//  Created by pzh on 2019/11/7.
//  Copyright © 2019 Panzhenghui. All rights reserved.
//

#ifndef ZHProtocol_h
#define ZHProtocol_h


/*
 *  添加代理  One Func
 */
#undef  AD_PROTOCOL
#define AD_PROTOCOL(__class,__method) \
@protocol Imp##__class##Delegate<NSObject> \
@optional \
AS_PROTOCOL(__class,__method)\
@end

/*
*  添加代理   Two Func
*/
#undef  AD_PROTOCOL2
#define AD_PROTOCOL2(__class,__method1,__method2) \
@protocol Imp##__class##Delegate<NSObject> \
@optional \
AS_PROTOCOL(__class,__method1)\
AS_PROTOCOL(__class,__method2)\
@end


/*
*  添加代理   Three Func
*/
#undef  AD_PROTOCOL3
#define AD_PROTOCOL3(__class,__method1,__method2,__method3) \
@protocol Imp##__class##Delegate<NSObject> \
@optional \
AS_PROTOCOL(__class,__method1)\
AS_PROTOCOL(__class,__method2)\
AS_PROTOCOL(__class,__method3)\
@end


/*
*  添加代理   Four Func
*/
#undef  AD_PROTOCOL4
#define AD_PROTOCOL4(__class,__method1,__method2,__method3,__method4) \
@protocol Imp##__class##Delegate<NSObject> \
@optional \
AS_PROTOCOL(__class,__method1)\
AS_PROTOCOL(__class,__method2)\
AS_PROTOCOL(__class,__method3)\
AS_PROTOCOL(__class,__method4)\
@end


/*
*  添加代理   Five Func
*/
#undef  AD_PROTOCOL5
#define AD_PROTOCOL5(__class,__method1,__method2,__method3,__method4,__method5) \
@protocol Imp##__class##Delegate<NSObject> \
@optional \
AS_PROTOCOL(__class,__method1)\
AS_PROTOCOL(__class,__method2)\
AS_PROTOCOL(__class,__method3)\
AS_PROTOCOL(__class,__method4)\
AS_PROTOCOL(__class,__method5)\
@end



/*
 *  代理方法定义
 */
#undef  AS_PROTOCOL
#define AS_PROTOCOL(__class,__name) \
-(void)function_##__class##_##__name##_cell:(ZHBaseCell*)cell data:(id)data;


/*
 *  代理方法执行
 */

#undef  DEF_PROTOCOL
#define DEF_PROTOCOL(__class,__name,__data) \
if (self.delegate && [self.delegate respondsToSelector:@selector(function_##__class##_##__name##_cell: data:)]) {\
[self.delegate function_##__class##_##__name##_cell:self data:__data];\
}


/*
 *  代理方法实现
 */
#undef  ON_PROTOCOL
#define ON_PROTOCOL(__class,__name,__cell,__data) \
-(void)function_##__class##_##__name##_cell:(ZHBaseCell*)__cell data:(id)__data

#endif /* ZHProtocol_h */
