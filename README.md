# Official Air Pollution Gem Documentation

This small library can help you speed up integrating air pollution API in your project. It takes data from aqicn.org and always returns the complete response in an easy-to-manipulate format.


# How to install

All you have to do is open your terminal and execute the following command

    gem install air-pollution-gem
Then you can use it in any ruby project by requiring it like this

    require 'pollution'

# Quick start
This whole library is really a single class called `Pollution`. You just have to create an object by doing:

    var = Pollution.new('YOUR TOKEN')

You can get your token [here](https://aqicn.org/data-platform/token/#/).

# Avaliable methods
|Method|Arguments  |
|--|--|
| City | city_name |
| Geo | latitude, logitude |
| here |  |
| Search | query |
| Map | latitude_1, logitude_1, latitude_2, logitude_2 |
## City

Returns the air pollution data of the given city or throws an error if the city wasn't found.

    p = Pollution.new('TOKEN')
    p.city('rome')

## Geo

Returns the air pollution data of the given coordinates.

    p = Pollution.new('TOKEN')
    p.geo(40.00000,23.00000)

## Here

Returns the air pollution data of the current location (IP Based).

    p = Pollution.new('TOKEN')
    p.here
## Search

Returns data about stations near the searched keyword.

    p = Pollution.new('TOKEN')
    p.search('berlin')

## Map

Returns the air pollution data of the area between the given coordinates.
This method takes 4 arguments: Latitude 1, Longitude 1, Latitude 2, Longitude 2.

    p = Pollution.new('TOKEN')
    p.map(40.00000,20.00000, 60.00000, 30.00000)

# That's it!
As you can see this little library is really straight-forward and easy to use.

> Coded, published and maintained by Cosimo Libutti
