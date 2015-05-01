//
//  TLMBackupOperation.m
//  TeX Live Utility
//
//  Created by Adam R. Maxwell on 09/27/10.
/*
 This software is Copyright (c) 2010-2015
 Adam Maxwell. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 
 - Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 - Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in
 the documentation and/or other materials provided with the
 distribution.
 
 - Neither the name of Adam Maxwell nor the names of any
 contributors may be used to endorse or promote products derived
 from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "TLMBackupOperation.h"
#import "TLMEnvironment.h"

@implementation TLMBackupOperation

+ (TLMBackupOperation *)newCleanOperation
{
    NSString *cmd = [[TLMEnvironment currentEnvironment] tlmgrAbsolutePath];
    return [[self alloc] initWithCommand:cmd options:[NSArray arrayWithObjects:@"backup", @"--clean", @"--all", nil]];
}

+ (TLMBackupOperation *)newDeepCleanOperation
{
    NSString *cmd = [[TLMEnvironment currentEnvironment] tlmgrAbsolutePath];
    return [[self alloc] initWithCommand:cmd options:[NSArray arrayWithObjects:@"backup", @"--clean=0", @"--all", nil]];
}

+ (TLMBackupOperation *)newRestoreOperationWithPackage:(NSString *)packageName version:(NSNumber *)version;
{
    NSParameterAssert(packageName);
    NSParameterAssert(version);
    NSString *cmd = [[TLMEnvironment currentEnvironment] tlmgrAbsolutePath];
    // --force is not documented, but according to Norbert will keep tlmgr from prompting y/n
    return [[self alloc] initWithCommand:cmd options:[NSArray arrayWithObjects:@"restore", @"--force", packageName, [version stringValue], nil]];
}

@end
