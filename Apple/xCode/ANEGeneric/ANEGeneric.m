/**
 * FLASHYWRAPPERS
 *   
 * @author Pavel Langweil
 * @version 2.55
 *
 * iOS / OS X port of FlashyWrappers. This was planned to be refactored similar to Windows where the encoder is in separate class, but never managed to get to it - feel free!
 * Whats really missing is the ability to record audio from AIR (in general recording audio was an issue) there might be dead code here which attempts that.
 * Also, iOS ReplayKit framework support was almost ready but then because AIR SDK didn't support the latest iOS SDK it couldn't be compiled so its untested. 
 *
 */

#import "FlashRuntimeExtensions.h"

FREObject helloWorld(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]) {
    NSLog(@"Entering helloWorld()");
    NSString *helloString = @"Hello World!";
    const char *str = [helloString UTF8String];
    FREObject retStr;
    FRENewObjectFromUTF8(strlen(str) + 1, (const uint8_t*)str, &retStr);
    return retStr;
}

void LNGenericANEContextInitializer(void *extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet) {
    NSLog(@"Entering ContextInitializer()");
    *numFunctionsToSet = 1;
    FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction) * 1);
    
    func[0].name = (const uint8_t*)"helloWorld";
    func[0].functionData = NULL;
    func[0].function = &helloWorld;
    
    *functionsToSet = func;
    
    NSLog(@"Exiting ContextInitializer()");
}

void LNGenericANEContextFinalizer(FREContext ctx) {
    NSLog(@"Entering ContextFinalizer()");
    NSLog(@"Exiting ContextFinalizer()");
    return;
}

void LNGenericANEInitializer(void **extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
    NSLog(@"Entering ExtInitializer()");
    *extDataToSet = NULL;
    *ctxInitializerToSet = &LNGenericANEContextInitializer;
    *ctxFinalizerToSet = &LNGenericANEContextFinalizer;    
    NSLog(@"Exiting ExtInitializer()");
}

void LNGenericANEFinalizer(void *extData) {
    NSLog(@"Entering ExtFinalizer()");
    NSLog(@"Exiting ExtFinalizer()");
    return;
}