#   ███████╗███████╗████████╗██╗   ██╗██████╗     
#   ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗    
#   ███████╗█████╗     ██║   ██║   ██║██████╔╝    
#   ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝     
#   ███████║███████╗   ██║   ╚██████╔╝██║         
#   ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝
############################################################
#      set up paths,the paths move around on repl          #
############################################################
replrootpath=$PWD
export LD_LIBRARY_PATH=$replrootpath/SFML-2.5.1/lib
export DISPLAY=:0.0
examplebasepath=$replrootpath/SFML-2.5.1/share/SFML/examples
cdate=$(date +%Y%m%dT%H%M%s)
backuptargetname=$target_file$cdate
backupsourcename=$source_file$cdate

# name your files here - this is your own thing to edit/complile in C++
source_file=$replrootpath/'rgb.cpp'
target_file=$replrootpath/'rgb'
# source_file=$examplebasepath/island.cpp
# target_file=$examplebasepath/island







#   ███████╗██╗  ██╗ █████╗ ███╗   ███╗██████╗ ██╗     ███████╗███████╗
#   ██╔════╝╚██╗██╔╝██╔══██╗████╗ ████║██╔══██╗██║     ██╔════╝██╔════╝
#   █████╗   ╚███╔╝ ███████║██╔████╔██║██████╔╝██║     █████╗  ███████╗
#   ██╔══╝   ██╔██╗ ██╔══██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝  ╚════██║
#   ███████╗██╔╝ ██╗██║  ██║██║ ╚═╝ ██║██║     ███████╗███████╗███████║
#   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝╚══════╝
################################################################################
#     uncomment to run an example SFML app instead of compiling rgb.cpp        #
#     or uncomment all to load sequentially                                    #
################################################################################

# cd $examplebasepath/island ; chmod +x ./island; ./island   # <<<<<< this one is neato 
# cd $examplebasepath/ftp ; chmod +x ftp; ./ftp
# cd $examplebasepath/joystick ; chmod +x joystick; ./joystick
# cd $examplebasepath/opengl ; chmod +x opengl; ./opengl    
# cd $examplebasepath/pong ; chmod +x pong ; ./pong
# cd $examplebasepath/shader ; chmod +x shader ; ./shader                       
# cd $examplebasepath/sockets ; chmod +x sockets; ./sockets         
# cd $examplebasepath/voip ; chmod +x voip ; ./voip
# cd $examplebasepath/window ; chmod +x window ; ./window
# cd $examplebasepath/X11Example ; chmod +x X11Example ; ./X11Example
# cd $examplebasepath/sound-capture ; chmod +x sound-capture; ./sound-capture   # Doesnt work in repl?
# cd $examplebasepath/sound ; chmod +x sound ; ./sound          # Doesnt work in repl?









#     ██████╗ ██████╗ ███╗   ███╗██████╗ ██╗██╗     ███████╗    ██╗████████╗
#    ██╔════╝██╔═══██╗████╗ ████║██╔══██╗██║██║     ██╔════╝    ██║╚══██╔══╝
#    ██║     ██║   ██║██╔████╔██║██████╔╝██║██║     █████╗      ██║   ██║   
#    ██║     ██║   ██║██║╚██╔╝██║██╔═══╝ ██║██║     ██╔══╝      ██║   ██║   
#    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║     ██║███████╗███████╗    ██║   ██║   
#     ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝    ╚═╝   ╚═╝   
######################################################################################
##     crappy if-loop that does versioning, checks mtime on file to see             ##
##     if cpp src file is modified newer than compiled binary                       ##
##     if so then move it to old_targets dir and remake with clang                  ##
######################################################################################
printf '\n%s\n' "Checking if main.cpp is newer than main binary"
if [ "$source_file" -nt "$target_file" ]
then
    printf '%s\n\n' "$source_file is newer than $target_file , moving old to $newtargetname
    and compiling"
    mv $target_file old_targets/$backuptargetname
    cp $source_file old_targets/$backupsourcename
    time clang++ -std=c++17 -LSFML-2.5.1/lib -lsfml-graphics -lsfml-window -lsfml-system $source_file -o $target_file -ISFML-2.5.1/include
    chmod 744 $target_file

fi








#   ███████╗████████╗ █████╗ ██████╗ ████████╗
#   ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝
#   ███████╗   ██║   ███████║██████╔╝   ██║   
#   ╚════██║   ██║   ██╔══██║██╔══██╗   ██║   
#   ███████║   ██║   ██║  ██║██║  ██║   ██║   
#   ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   
######################################################################################
#                 if we made it this far, start your program                         # 
######################################################################################
printf '\n%s\n' "starting RGB binary"
$target_file
echo "done"



