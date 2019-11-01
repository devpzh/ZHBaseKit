//
//  ProtocolMacro.h
//  Pods
//
//

#ifndef ProtocolMacro_h
#define ProtocolMacro_h


/*
 *  代理声明
 */

#undef  PROTOCOL
#define PROTOCOL(__class,__method) \
@protocol Imp##__class##Delegate<NSObject> \
@optional \
AS_PROTOCOL(__class,__method)\
@end


/*
 *  代理方法定义
 */
#undef  AS_PROTOCOL
#define AS_PROTOCOL(__class,__name) \
-(void)function_##__class##_##__name##_cell:(BaseCell*)cell data:(id)data;


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
-(void)function_##__class##_##__name##_cell:(BaseCell*)__cell data:(id)__data


#endif /* ProtocolMacro_h */
