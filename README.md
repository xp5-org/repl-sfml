```
██╗███╗   ██╗███████╗ ██████╗ 
██║████╗  ██║██╔════╝██╔═══██╗
██║██╔██╗ ██║█████╗  ██║   ██║
██║██║╚██╗██║██╔══╝  ██║   ██║
██║██║ ╚████║██║     ╚██████╔╝
╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ 
```

https://repl.it/@qcm/SFML-Demo#readme
https://github.com/xp5-org/repl-sfml

I hope this repl can inspire others to learn and interact with SFML in C++ more easily. 
Do let me know if there are any changes i can help with 


How to use, things to do and explore:
1) Click run, to run included simple demo (open window, make colored circles)
2) read SFML docs, try out some code changes and hit run again - it will rebuild and re run
3) edit script.bash, try out island example or pong demo. 
4) edit paths in script.bash to edit island/pong/shader/etc included examples


the script is set up to do the following:
- skip past all the commented-out example programs pre-compiled
- check if rgb.cpp is modified newer than rgb binary 
- - if yes, copy old bin and src file to old_targets, then recompile, and run binary in X
- - if no , skip to running the rgb binary and start X 



The script.bash file contains examples, the best of which are in this order:
- island
- shader
- opengl

uncomment the example line in the script.bash file to run the examples (island below): 
- # cd $examplebasepath/island ; chmod +x island; ./island


If you want to edit something, the script is already set up compile/version/execute "RGB" , 
it is a broken example of 3-windows opening and displaying a circle. it is broken because currently
it is only monitoring for window1 status








███████╗██████╗ ██████╗  ██████╗ ██████╗ ███████╗
██╔════╝██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██╔════╝
█████╗  ██████╔╝██████╔╝██║   ██║██████╔╝███████╗
██╔══╝  ██╔══██╗██╔══██╗██║   ██║██╔══██╗╚════██║
███████╗██║  ██║██║  ██║╚██████╔╝██║  ██║███████║
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

Sometimes i get the following error after my program closes strangely or if i exit the repl and reopen:
===================================================================
Loading main binary 
Starting X
..............................................................FATAL: /usr/bin/polygott-x11-vnc: Gave up waiting for X server :0
Failed to open X11 display; make sure the DISPLAY environment variable is set correctly
script.bash: line 79:   890 Aborted                 (core dumped) $replrootpath/$target_file
done
===================================================================

i am not sure how to resolve it, sometimes killing the open xorg sessions resolves, sometimes 
the only way to fix is close repl and wait hours - or an immediate workaround is to FORK the repl 
as the forked repl will inherit a new environment. I need to figure out how to reset X11/Xorgvnc/etc 
at the start of this bash script

if you are getting errors running this the second or third time but worked the first or are getting 
strange behavior - such as windows which should be windowed are now full-screen with no 
option to close  - this can be due to a bad environent on REPL and will need to let the environment 
close and reset after some time passes. 









 ██████╗██████╗ ███████╗██████╗ ██╗████████╗███████╗
██╔════╝██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝██╔════╝
██║     ██████╔╝█████╗  ██║  ██║██║   ██║   ███████╗
██║     ██╔══██╗██╔══╝  ██║  ██║██║   ██║   ╚════██║
╚██████╗██║  ██║███████╗██████╔╝██║   ██║   ███████║
 ╚═════╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝   ╚═╝   ╚══════╝

 REPL cloned from:          https://repl.it/@SPQR
 SFML Docs:                 https://www.sfml-dev.org/documentation/2.1/index.php
 ASCII art generator:       https://manytools.org/hacker-tools/ascii-banner/
 my github:                 https://github.com/xp5-org/repl-sfml/
