//QCMs grid demo example for SFML & replit
#include <SFML/Graphics.hpp>
#include <cstdlib> // For rand() and srand()
#include <ctime>   // For time()
#include <chrono>  // For std::chrono
#include <thread>  // For std::this_thread::sleep_for

int main()
{
    // Seed the random number generator
    std::srand(static_cast<unsigned int>(std::time(nullptr)));

    // Timer for updating colors
    std::chrono::time_point<std::chrono::system_clock> lastUpdateTime = std::chrono::system_clock::now();

    // Create the window
    sf::RenderWindow window(sf::VideoMode(800, 800), "QCMs SFML Grid Demo");

    // Sleep duration for the logic loop
    int sleepDuration = 100; // Set the desired sleep duration in milliseconds

    // Define the size of the grid
    const int gridSize = 16;

    // Calculate the size of each grid cell
    const int cellSize = window.getSize().x / gridSize;

    // Create a 2D array to hold the colors for each grid cell
    sf::Color gridColors[gridSize][gridSize];

    // Randomly fill each grid cell with a random color
    for (int row = 0; row < gridSize; ++row)
    {
        for (int col = 0; col < gridSize; ++col)
        {
            // Generate a random color
            sf::Uint8 red = std::rand() % 256;
            sf::Uint8 green = std::rand() % 256;
            sf::Uint8 blue = std::rand() % 256;
            gridColors[row][col] = sf::Color(red, green, blue);
        }
    }





    // Main Logic loop
    while (window.isOpen())
    {
        // Process events
        sf::Event event;
        while (window.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        // Check if it's time to update a block
        auto currentTime = std::chrono::system_clock::now();
        std::chrono::duration<double> elapsedSeconds = currentTime - lastUpdateTime;
        if (elapsedSeconds.count() >= sleepDuration / 1000.0) // Use the defined sleep duration variable
        {
            // Update a random block with a random color
            int row = std::rand() % gridSize;
            int col = std::rand() % gridSize;
            sf::Uint8 red = std::rand() % 256;
            sf::Uint8 green = std::rand() % 256;
            sf::Uint8 blue = std::rand() % 256;
            gridColors[row][col] = sf::Color(red, green, blue);

            // Update the last update time
            lastUpdateTime = currentTime;
        }
        else
        {
            // Sleep to reduce CPU usage
            std::this_thread::sleep_for(std::chrono::milliseconds(sleepDuration)); // Use the defined sleep duration variable
        }

        // Clear the window
        window.clear();

        // Draw the grid with random colors
        for (int row = 0; row < gridSize; ++row)
        {
            for (int col = 0; col < gridSize; ++col)
            {
                // Create a rectangle shape for each grid cell
                sf::RectangleShape cell(sf::Vector2f(cellSize, cellSize));

                // Set the position of the cell based on the row and column
                cell.setPosition(col * cellSize, row * cellSize);

                // Set the color of the cell based on the random color
                cell.setFillColor(gridColors[row][col]);

                // Draw the cell
                window.draw(cell);
            }
        }

        // Display the window
        window.display();
    }

    return 0;
}
