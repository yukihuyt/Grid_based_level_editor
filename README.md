# Grid Based 2D Level Editor Demo :space_invader:

This is a tiny demo made by [Godot engine](https://godotengine.org/) to check what I learnt about Godot from scratch in 12 days, and definitely, to have fun :wink: The idea of this demo's UX and functionality design was inspired by a lot simulation or tycoon games.

#### Try it!
To try and maybe modify it then apply to your own project, you first need to download and install the open-source [Godot game engine](https://godotengine.org/download/windows). Then import the `project.godot` file into the engine. Dah, run it!

Here's what I got as results:
Select the object from Item Menu, mouse left click on the available area on grid map to place a item. If overlapping detect, an alert massage will pop up and placement not allowed.
![results showcase 01](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/001.gif)

Press `delete` to change the cursor sprite to the trash bin icon, while the `delete` is pressed, mouse left click on an existed item will remove it from current grid map.
![results showcase 02](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/002.gif)


<br/>
<br/>
---
## Implementation Details
Code structure:
![code structure](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/structure1.png)



The demo mainly implemented these things:
* 2D grid-based map system
* An Item class which can set specified size and sprite texture
* One list and one dictionary to store the map and placed items information
* An Item Menu and show the selectable items, items can be selected from it
* Can place objects on the map and delete existed objects from map
* No overlapping placement allowed, alert message will pop up if detected
