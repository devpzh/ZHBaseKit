//
//  PropertyMacro.h
//
//  Created by 潘政徽
//

#ifndef PropertyMacro_h
#define PropertyMacro_h


#define kPS     @property(nonatomic,copy)  NSString*
#define kPN     @property(nonatomic,copy)  NSNumber*
#define kPA     @property(nonatomic,copy)  NSArray*
#define kPMA    @property(nonatomic,strong)NSMutableArray*
#define kPD     @property(nonatomic,copy)  NSDictionary*

#define kPint   @property(nonatomic,assign)int
#define kPfloat @property(nonatomic,assign)float
#define kPbool  @property(nonatomic,assign)BOOL
#define kPnsint @property(nonatomic,assign)NSInteger



//属性定义 define
#define    AD_PROPERTY( decorate, __class, __tag ) \
@property  (nonatomic, decorate) __class *    __tag;

#define    AD_ASSIGN_PROPERTY(  __class, __tag ) \
@property  (nonatomic, assign) __class   __tag;

#define    AD_WEAK  ( __class, __tag )     AD_PROPERTY( weak, __class, __tag )
#define    AD_STRONG( __class, __tag )     AD_PROPERTY( strong, __class, __tag )
#define    AD_ASSIGN( __class, __tag )     AD_ASSIGN_PROPERTY( __class, __tag )
#define    AD_COPY  ( __class, __tag )     AD_PROPERTY( copy, __class, __tag )



#endif /* PropertyMacro_h */
