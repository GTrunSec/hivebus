export PAHT=$PATH
title="$(hyprctl activewindow -j | jq -r '. | .title')"
class="$(hyprctl activewindow -j | jq -r '. | .class')"

if [ "$title" == "$class" ]; then
  echo "$title"
else
  echo "$title :: $class"
fi
