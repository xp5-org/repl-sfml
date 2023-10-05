// Reference : https://www.sfml-dev.org/tutorials/2.5/window-window.php

#include "SFML/Graphics.hpp"
#include "SFML/Window.hpp"

int main()
{



// inside the main loop, between window.clear() and window.display()
    
    sf::RenderWindow windowone(sf::VideoMode(200, 200), "First Window");
    sf::CircleShape shapeone(100.f);
    shapeone.setFillColor(sf::Color::Green);

    while (windowone.isOpen())
    {
        sf::Event event;
        while (windowone.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                windowone.close();
        }
        windowone.clear();
        windowone.draw(shapeone);
        windowone.display();
    }
    

    return 0;
}