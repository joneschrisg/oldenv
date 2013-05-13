# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

##-----------------------------------------------------------------------------
## My modifications

# Add js.jar to the java classpath
CLASSPATH="$CLASSPATH:$HOME/lib/java:$HOME/lib/java/js.jar"

# Extend ld search path
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

# Add home bin directories to path
PATH="$HOME/sbin:$HOME/usr/bin:$PATH:$HOME/bin"

##-----------------------------------------------------------------------------
## Groovy
##
#GROOVY_HOME=$HOME/groovy/groovy-1.0
#PATH=${PATH}:$HOME/groovy/groovy-1.0/bin

##-----------------------------------------------------------------------------
## Intel compiler
##
#LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/intel/cc/10.0.023/lib"

##-----------------------------------------------------------------------------
## Ptolemy
##
PTII="$HOME/src/ptII6.0.2"

##-----------------------------------------------------------------------------
## Android
##
ANDROID_PRODUCT_OUT="$HOME/android/out/target/product/generic/" 

