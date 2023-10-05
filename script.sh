echo hello
nix-shell -p sfml csfml --run '
    # Command 1
    echo "Running G++ compile command"
    bash -c "g++ -g -O3 main.cpp -o main -lsfml-graphics -lsfml-window -lsfml-system" > >(tee -a output.log) 2>&1

    # Command 2
    echo "Starting compiled program"
    bash -c "./main"

    # Example Command 3
    #echo "Running Command 3"
    #bash -c "echo hmm3"
'