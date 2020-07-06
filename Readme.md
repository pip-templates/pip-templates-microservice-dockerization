# Overview

This is template for docker environment for .NET Core microservice.

# Usage

Copy all dockerfiles to microservice docker folder and manually create build configuration (pipeline) on TFS. 
Build Steps - create 'Command line' steps and run powershell scripts in next order 
    
    1) build.ps1
    2) test.ps1
    3) package.ps1
    4) publish.ps1
    5) tag.ps1
    6) release.ps1
    7) clean.ps
    
    For clean step set Execution to 'Always, even if build stop command was issued'.
