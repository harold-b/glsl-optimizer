#! /bin/sh

CXX=clang++

echo Compiling...

$CXX -o ./Bin/glslopt --std=c++11 -stdlib=libc++ -O3 -g -flto \
	-I./src/ -I./src/getopt/ -I./src/glsl/ -I./src/mesa/ -I./include/ \
	-L./Bin/Release	\
	-lglsl_optimizer \
	src/glsl/main.cpp \
	src/getopt/getopt_long.c
