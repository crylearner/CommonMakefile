#! /bin/sh

function usage()
{
cat<<USAGE
mm <dir> 编译当前路径或者父路径的module.mk
mmm <module.mk>  编译指定的module.mk, 可以同时指定多个。
choosecombo  --buildtype=<debug/release>  --product=<name> --platform=<name>
USAGE
}

##
# 获取当前项目的根目录。
# @return 如果存在项目存在，则返回项目根目录的绝对路径。否则为空
function gettop
{
    local TOPFILE=build/main.mk
    if [ -n "$TOP" -a -f "$TOP/$TOPFILE" ] ; then
        echo $TOP
    else
        if [ -f $TOPFILE ] ; then
            # The following circumlocution (repeated below as well) ensures
            # that we record the true directory name and not one that is
            # faked up with symlink names.
            PWD= /bin/pwd
        else
            # We redirect cd to /dev/null in case it's aliased to
            # a command that prints something as a side-effect
            # (like pushd)
            local HERE=$PWD
            T=
            while [ \( ! \( -f $TOPFILE \) \) -a \( $PWD != "/" \) ]; do
                cd .. > /dev/null
                T=`PWD= /bin/pwd`
            done
            cd $HERE > /dev/null
            if [ -f "$T/$TOPFILE" ]; then
                echo $T
            fi
        fi
    fi
}

##
# 从当前路径开始，逐层向上查找模块makefile
# @return  如果有找到，则返回模块makefile的绝对路径；否则为空
function findmakefile()
{
    local TOPFILE=build/main.mk
	local MODULE_MK=module.mk
    # We redirect cd to /dev/null in case it's aliased to
    # a command that prints something as a side-effect
    # (like pushd)
    local HERE=$PWD
    T=
    while [ \( ! \( -f $TOPFILE \) \) -a \( $PWD != "/" \) ]; do
        T=$PWD
        if [ -f "$T/$MODULE_MK" ]; then
            echo $T/$MODULE_MK
            cd $HERE > /dev/null
            return
        fi
        cd .. > /dev/null
    done
    cd $HERE > /dev/null
}

##
# 模块化编译命令，可以指定一个或者多个模块makefile。路径使用相对于当前路径的相对路径
# 
# example: mm module.mk  hello/module.mk
function mm()
{
	# Find the closest Android.mk file.
	T=$(gettop)
	local M=$(findmakefile)
	# Remove the path to top as the makefilepath needs to be relative
	local M=`echo $M|sed 's:'$T'/::'`
	if [ ! "$T" ]; then
		echo "Couldn't locate the top of the tree.  Try setting TOP."
	elif [ ! "$M" ]; then
		echo "Couldn't locate a makefile from the current directory."
	else
		echo SHOT_MODULE="$M"
		SHOT_MODULE=$M make -C $T
	fi
}

##
# 模块化编译命令，可以指定一个或者多个模块makefile。路径使用相对于当前路径的相对路径
# 
# example: mmm module.mk  hello/module.mk
function mmm()
{
    T=$(gettop)
	local MODULES=
	
    if [ "$T" ]; then
        for module in "$@"; do
			if [ -f $module ]; then
				MODULES="$MODULES `echo $PWD/$module|sed 's:'$T'/::'`"
			else
				echo "Couldn't locate module makefile of $module"
			fi
		done
		echo SHOT_MODULE="$MODULES"
        SHOT_MODULE="$MODULES" make -C $T
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP."
    fi
}

function list_products()
{
	T=$(gettop)
	if [ -z $T ];then
		echo "Couldn't locate the top of the tree.  Try setting TOP." >& 2
		return
	fi
	
	cd $T/build/products > /dev/null && \
	ls -d */ | sed 's:/$::' && \
	cd - > /dev/null
}

function list_platforms()
{
	echo "x86-linux arm-linux"
}

function choosecombo()
{
    while [ $# -gt 0 ]; do
		case $1 in
		--buildtype=*)
			buildtype=${1#--buildtype=}
			export TARGET_BUILD_TYPE=$buildtype
			;;
		--product=*)
			product=${1#--product=}
			export TARGET_PRODUCT=$product
			;;
		--platform=*)
			platform=${1#--platform=}
			export TARGET_PLATFORM=$platform
			;;
		--help)
			usage ;;
		*) 
			echo	"unknown command $1"
			;;
		esac
		shift
	done
}

function __choosecombo_completion()
{
	local cur
	_get_comp_words_by_ref -n = cur
    COMPREPLY=()
	case "${cur}" in
	--buildtype=*)
		local options="debug release"
		COMPREPLY=( $(compgen -W "${options}" -- ${cur#--buildtype=}) )
		;;
	--product=*)
		local options=`list_products`
		COMPREPLY=( $(compgen -W "${options}" -- ${cur#--product=}) )
		;;
	--platform=*)
		local options=`list_platforms`
		COMPREPLY=( $(compgen -W "${options}" -- ${cur#--platform=}) )
		;;
	*)
		local options="--help --buildtype= --product= --platform="
		COMPREPLY=( $(compgen -W "${options}" -- ${cur}) )
		;;
	esac
}

function __HUB_completion() {
	local cur prev words cword
	_get_comp_words_by_ref -n = cur prev words cword
	case $cword in
	0) ;;
	*) eval __${words[0]}_completion ;;
	esac
}

complete -F __HUB_completion choosecombo