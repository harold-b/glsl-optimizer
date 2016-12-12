@echo off

:: set up windows build environment
SET VCVARS="C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
call %VCVARS%

SET OBJ_DIR=.\Obj\
SET OUT_DIR=.\Bin\

SET OUT_NAME=glslopt.exe
SET OUT_PATH=%OUT_DIR%%OUT_NAME%

rmdir /s /q %OBJ_DIR%
mkdir %OBJ_DIR%

rmdir /s /q %OUT_DIR%
mkdir %OUT_DIR%

SET SOURCES=^
     src/glsl/main.cpp ^
     src/getopt/getopt_long.c

echo Compiling...
CL /nologo /c /MT /MP /EHsc /GL /O2 ^
 /I"src/" ^
 /I"src/getopt/" ^
 /I"src/glsl/" ^
 /I"src/mesa/" ^
 /I"include/" ^
 /Fo%OBJ_DIR% %SOURCES%

 echo Linking...
 LINK /NOLOGO /LTCG /MACHINE:X86 /SUBSYSTEM:CONSOLE ^
    /LIBPATH:"../../../../Libs/Windows/Release_Win32/" ^
    /OUT:%OUT_PATH% ^
    ./projects/vs2010/build/glsl_optimizer_lib/Release/bin/glsl_optimizer_lib-win32.lib ^
    %OBJ_DIR%main.obj ^
    %OBJ_DIR%getopt_long.obj