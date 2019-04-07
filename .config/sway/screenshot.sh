name=~/screenshot.png;
grim -g "$(slurp)" $name;
cat $name | wl-copy; #not sure if this works reliably
#eog $name; #if it does not, we need this
