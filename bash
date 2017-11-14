1、DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"

Bash maintains a number of variables including BASH_SOURCE which is an array of source file pathnames.

${} acts as a kind of quoting for variables.

$() acts as a kind of quoting for commands but they're run in their own context.

dirname gives you the path portion of the provided argument.

cd changes the current directory.

pwd gives the current path.

&& is a logical and but is used in this instance for its side effect of running commands one after another.

In summary, that command gets the script's source file pathname, strips it to just the path portion, cds to that path, 
then uses pwd to return the (effectively) full path of the script. This is assigned to  DIR. 
After all of that, the context is unwound so you end up back in the directory you started at but with an environment variable 
DIR containing the script's path.

BASH_SOURCE[0] 等价于 BASH_SOURCE， 取得当前执行的shell文件所在的路径及文件名。
如/home/abc/test.sh 内容如下：
#!/bin/sh
echo "${BASH_SOURCE[0]}"
echo "${BASH_SOURCE]}"
echo "$( dirname "${BASH_SOURCE[0]}" )"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

若当前目录在/home/,执行source ./abc/test.sh, 则输出：
./abc/test.sh
./abc/test.sh
./abc/
/home/abc

总之：
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 得到shell脚本文件所在完整路径（绝对路径）及文件名（无论source,sh,.三种调用方式），
且不改变shell的当前目录。
