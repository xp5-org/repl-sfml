// Refrence : https://www.sfml-dev.org/tutorials/2.5/window-window.php

#include "SFML/Graphics.hpp"
#include "SFML/Window.hpp"

int main()
{



// inside the main loop, between window.clear() and window.display()
    
    sf::RenderWindow windowone(sf::VideoMode(200, 200), "First Window");
    sf::RenderWindow windowtwo(sf::VideoMode(200, 200), "Second Window");
    sf::RenderWindow windowthree(sf::VideoMode(200, 200), "Third Window");
    sf::CircleShape shapeone(100.f);
    sf::CircleShape shapetwo(100.f);
    sf::CircleShape shapethree(100.f);
    shapeone.setFillColor(sf::Color::Green);
    shapetwo.setFillColor(sf::Color::Blue);
    shapethree.setFillColor(sf::Color::Red);

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
    
    while (windowtwo.isOpen())
    {
        sf::Event event;
        while (windowtwo.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                windowtwo.close();
        }
        windowtwo.clear();
        windowtwo.draw(shapetwo);
        windowtwo.display();
    }
    
    while (windowthree.isOpen())
    {
        sf::Event event;
        while (windowthree.pollEvent(event))
        {
            if (event.type == sf::Event::Closed)
                windowthree.close();
        }
        windowthree.clear();
        windowthree.draw(shapethree);
        windowthree.display();
    }

    return 0;
}