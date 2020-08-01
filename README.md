#Grid Based 2D Level Editor Demo

This is a tiny demo made by [Godot engine](https://godotengine.org/) to check what I learnt about Godot in 12 days, and definitely, to have fun :D The idea of this demo's UX and functionality design was inspired by a lot simulation or tycoon games.

To try and maybe modify it then apply to your own project, you first need to download and install the open-source [Godot game engine](https://godotengine.org/download/windows). Then import the `project.godot` file into the engine. Dah, run it!

Here's what I got as results:
Select the object from Item Menu, mouse left click on the available area on grid map to place an object. If overlapping detect, an alert massage will pop up and placement not allowed.
![results showcase 01](./doc_recourses/001.gif)

Press `delete` to change the cursor sprite to the trash bin icon, while the `delete` is pressed, mouse left click on an existed object will remove it from current grid map.
![results showcase 02](./doc_recourses/002.gif)



##Implementation Details
Code structure(the view shown in Godot engine):


The demo mainly implemented these things:
* 2D grid-based map system
* An Object type which can set specified size and sprite texture
* One list and one dictionary to store the map and placed objects information
* An Item Menu and show the selectable objects, objects can be selected from it
* Can place objects on the map and delete existed objects from map
* No overlapping placement allowed, alert message will pop up if detected
