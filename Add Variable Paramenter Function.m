// 添加可变参数函数
// 
// Platform: All
// Language: Objective-C
// Completion Scope: Class Implementation

- (void)<#FucntionName#>:(<#ArgumentType#>)<#ArgumentName#>, ... NS_REQUIRES_NIL_TERMINATION{
    va_list params;
    va_start(params, <#ArgumentName#>);
    
    NSArray *argsArray = [self variableParameterFunction:<#ArgumentName#> arguments:params];
    
    <#DoSomething#>
}

/**
 *  获取可变参数函数的所有参数（包括第一个参数）
 *
 *  @param arg1    第一个参数
 *  @param argList 其他参数的列表
 *
 *  @return 包含所有参数的数组
 *
 *  @abstract ！注：最后一个参数必须为nil,并且其他参数不能为nil，否则会导致崩溃
 */
- (NSArray *)variableParameterFunction:(NSString *)arg1 arguments:(va_list)argList{
    NSMutableArray *argsArray = [[NSMutableArray alloc] initWithCapacity:2];
    
    va_list params = argList;
    //    va_start(params, arg1);
    id arg;
    
    if(arg1){
        id prev = arg1;
        [argsArray addObject:prev];
        do{
            if(arg){
                [argsArray addObject:arg];
            }
            arg = va_arg(params, id);
        }while (arg != nil);
        va_end(params);
    }
    return argsArray;
}

