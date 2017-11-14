1、DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"

Bash maintains a number of variables including BASH_SOURCE which is an array of source file pathnames.

${} acts as a kind of quoting for variables.

$() acts as a kind of quoting for commands but they're run in their own context.

dirname gives you the path portion of the provided argument.

cd changes the current directory.

pwd gives the current path.

&& is a logical and but is used in this instance for its side effect of running commands one after another.

In summary, that command gets the script's source file pathname, strips it to just the path portion, cds to that path, then uses pwd to return the (effectively) full path of the script. This is assigned to  DIR. After all of that, the context is unwound so you end up back in the directory you started at but with an environment variable DIR containing the script's path.
