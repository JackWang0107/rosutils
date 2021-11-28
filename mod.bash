rospymode(){
    echo "==================================================================="
    echo -e "\e[1;32m Switching *Python Env* to ros in conda\e[0m"
    ros
    echo "==================================================================="
    echo -e "\e[1;32m Changing privilege of scripts in workspace\e[0m"
    echo "==================================================================="
    dir=`pwd`
    for file in $dir/src/*; do
	if [ -d $file ]; then
	    if [ -e $file/scripts ]; then
	        echo " Change mode +x for file in ${file}"
                if [ "$(ls -A $file/scripts)" ]; then
                    echo "$file/scripts is not Empty"
                    chmod +x $file/scripts/*
                else
                    echo "$file/scripts is *EMPTY*, skipping"
                fi
	    else
		echo " Skipping, ${file} doesn't exist"
	    fi
	fi
    done
    echo "==================================================================="
    echo -e "\e[1;32m Changing privilege of config in workspace\e[0m"
    echo "==================================================================="
    dir=`pwd`
    for file in $dir/src/*; do
	if [ -d $file ]; then
	    if [ -e $file/cfg ]; then
	        echo " Change mode +x for file in ${file}"
                if [ "$(ls -A $file/cfg)" ]; then
                    echo "$file/cfg is not Empty"
	            chmod +x $file/cfg/*
                else
                    echo "$file/cfg is *EMPTY*, skipping"
                fi
	    else
		echo " Skipping, ${file} doesn't exist"
	    fi
	fi
    done
    echo "==================================================================="
    echo -e "\e[1;32m Sourcing devel/setup.bash... \e[0m"
    if [ -e $dir/devel/setup.bash ]; then
        t=`source $dir/devel/setup.bash --extend`
	source $dir/devel/setup.bash --extend
    else
	echo " Skip: ${dir}/devel/setup.bash not exists"
    fi
    echo "==================================================================="
    echo -e "\e[1;33m First running a new-built package may not have completaion\e[0m"
    echo -e "\e[1;33m Running *ROSPACK PROFILE* to compenstate\e[0m"
    rospack profile
    echo "==================================================================="
}
alias mod="rospymode"
