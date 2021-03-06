alias rw='head -n $[$RANDOM % $(cat /usr/share/dict/words | wc -l)] /usr/share/dict/words | tail -n 1'

alias weather="curl -s 'http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=en|us|seattle-wa|98104' | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'"

alias httpserver="python -m SimpleHTTPServer"

function up {
ups=""
for i in $(seq 1 $1)
do
    ups=$ups"../"
done
cd $ups
}

function rp() {
	if [ -z $1 ]; then
		MAXSIZE=10
	else
		MAXSIZE=$1
	fi
	array1=(
	q w e r t y u i o p a s d f g h j k l z x c v b n m Q W E R T Y U I O P A S D
	F G H J K L Z X C V B N M 1 2 3 4 5 6 7 8 9 0
	\! \@ \$ \% \^ \& \* \! \@ \$ \% \^ \& \* \@ \$ \% \^ \& \*
	)
	MODNUM=${#array1[*]}
	pwd_len=0
	while [ $pwd_len -lt $MAXSIZE ]
	do
	    index=$(($RANDOM%$MODNUM))
	    echo -n "${array1[$index]}"
	    ((pwd_len++))
	done
	echo
}

function filestolower(){
  read -p "This will rename all the files and directories to lowercase in the current folder, continue? [y/n]: " letsdothis
  if [ "$letsdothis" = "y" ] || [ "$letsdothis" = "Y" ]; then
    for x in `ls`
      do
      skip=false
      if [ -d $x ]; then
	read -p "'$x' is a folder, rename it? [y/n]: " renamedir
	if [ "$renamedir" = "n" ] || [ "$renameDir" = "N" ]; then
	  skip=true
	fi
      fi
      if [ "$skip" == "false" ]; then
        lc=`echo $x  | tr '[A-Z]' '[a-z]'`
        if [ $lc != $x ]; then
          echo "renaming $x -> $lc"
          mv $x $lc
        fi
      fi
    done
  fi
}

PS1="\[\e[;36m\][\d \t] $USER~ \$ \[\e[m\]"

