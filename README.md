# Grid Based 2D Level Editor Demo :space_invader:

This is a tiny demo made by [Godot engine](https://godotengine.org/) to check what I learned about Godot from scratch in 12 days, and definitely, to have fun :wink: The idea of this demo's UX and functionality design was inspired by a lot simulation or tycoon games.

Thanks to [GDQuest](https://www.youtube.com/channel/UCxboW7x0jZqFdvMdCFKTMsQ), which is an amazing channel upload videos frequently about basic and pro knowledge of Godot, along with some interesting little projects. I learned a lot by watching their videos and if you are confused about how to start learning Godot, go check their channel!


#### Try the demo!
To try and maybe modify it then apply to your own project, you first need to download and install the open-source [Godot game engine](https://godotengine.org/download/windows). Then import the `project.godot` file into the engine. Then you can open and test the project in Godot.

Here's what I got as results:
Select the object from Item Menu, mouse left click on the available area on the grid map to place an item. If overlapping detects, an alert message will pop up and placement not allowed.
<br/>

![results showcase 01](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/001.gif)

<br>

Press `delete` to change the cursor sprite to the trash bin icon, while the `delete` is pressed, mouse left click on an existed item will remove it from current grid map.

<br>

![results showcase 02](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/002.gif)


<br>
<br>

## Implementation Details
Code structure:
![code structure](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/structure01.png)

Godot engine offers a lot of pre-defined classes that can be instantiated, extended or cuztomized then.
The `Main` is a basic `Node` class, which demonstrate the main scene of the project.

In this demo, the `Main` contains 4 parts:

- The `Grid_visualizer` draws lines to show the grid map;
- The `Room` shows the placed items on the top;
- The `Editor` was the 'logic layer' which contains the implementation of the grid map system, the item placement a deletion function and data structures storing the information of grid map and placed item.
- The `ItemMenu` implements the menu on the bottom, which presents the selectable items, and allows user to select the item from the menu. 

The `ItemMenu` includes a `TabContainer` which contains the 3 tabs. Each tab contains a tab button, and a scrollable container which then stores and shows the items in this tab.

The `Item_object` stores 2 textures of one item which will be used for the mouse cursor sprite and the showcase card in the ItemMenu tabs. The `Item_node` was the object will be instantiated on the `Room` layer when new item being placed on the grid map.
The function `_item_clicked` will be triggered when the item in `ItemMenu` is clicked. It will deliver textures and instantiable node of the selected item to the `Editor` for further calculation and updating.

The whole process of placing an item on the grid map can be described as:
<br>

![item placement logics](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/item_placement.png)

<br>

## What I learnt
###### Gameplay code architecture
With this small demo project, I have my first impression of how we should design the code structure of gameplay for a possible simulation or tycoon game. Although this is a small project, if needed, we can extend this level editor's structure with new classes or inherit and extend current classes as well for a whole indie game or game with level editor as the main part. 

I can imagine that for a huge project, the code architecture can be complex and massive. But with this experience, I have more confidence to try to build a larger, more complicated and robust one in the future.

###### OOP design
Since Godot has offered all those useful well-designed classes, I do not need to write them on my own, but I did get some inspiration for what kind of classes are necessary or helpful for a level editor. So next time if I need to implement the same or similar functions using another engine or even I need to write part of a new engine, I know what classes I need to design and create then.

###### Interactions between scripting language and base part
Besides, I learned how the scripts connect to and interact with the base classes which were commonly written in other languages (like C++ or C#). I learned the built-in scripting language gd-script within one day and then can smoothly write codes using it. I believe this shows that I can acquire sufficient fluency of one new scripting language (like Lua or Go) in a short time, then start to use it in the working project on hand in the future.
