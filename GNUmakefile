#
# This script was developed for SweetTutos Tutorials
# www.sweettutos.com
#
include $(GNUSTEP_MAKEFILES)/common.make
# make a simple program in Objective-C, call it SweetTutos
TOOL_NAME = hello
# The implementation Objective-C file which is going to be compiled
hello_OBJC_FILES = main.m Car.m Engine.m Tire.m Slant6.m FindFile.m Worker.m MyCar.m
# Header files of your project
#SweetTutos_HEADER_FILES = xxx.h //here goes all header files (.h). For the moment, on n'en a pas.
# Define compilation flags
ADDITIONAL_CPPFLAGS = -Wall -std=gnu99
#ADDITIONAL_OBJCFLAGS = -fobjc-abi-version=4

-include GNUmakefile.preamble
# Include rules for creating a command line tool for Objective-C
include $(GNUSTEP_MAKEFILES)/tool.make