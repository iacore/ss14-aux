#!/usr/bin/fish
#
set root ~/"computing/game/space-station-14/Resources/Prototypes/Entities/Structures/Storage/Closets/"

set files $root/**.yml

true > staging
for f in $files
	echo processing $f
	# there was once a garbage software called PyYAML and it cannot ignore tags
	yq < $f | ./extract >> staging
	#./extract < $f >> staging
end

echo "digraph {" > out.dot
cat staging >> out.dot
echo "}" >> out.dot

