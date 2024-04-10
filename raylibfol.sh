#!/bin/bash

mkdir $1 && cd $1 && touch main.c build.bash

chmod 777 build.bash

echo -e "#!/bin/bash\ngcc main.c -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -I/usr/local/include -L/usr/local/lib\n" >> build.bash
