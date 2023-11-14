#!/usr/bin/fish
#
set root "../space-station-14/Resources/Prototypes/Entities/Structures/Storage/Closets/"

set files $root/**.yml

true > staging
for f in $files
	yq 'map((.parent+" -> "+.id))' < $f >> staging
end

echo "digraph {" > out.dot
jq -sr 'reduce .[] as $x ([]; . + $x)|.[]' < staging >> out.dot
echo "}" >> out.dot

