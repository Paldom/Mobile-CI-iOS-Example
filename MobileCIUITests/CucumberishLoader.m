//
//  CucumberishLoader.m
//  MobileCIUITests
//
//  Created by Domonkos Pal
//  Copyright © 2019. Domonkos Pal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MobileCIUITests-Swift.h"

__attribute__((constructor))
void CucumberishInit(){
    [CucumberishInitializer CucumberishSwiftInit];
}

