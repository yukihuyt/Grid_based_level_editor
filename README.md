# Grid Based 2D Level Editor Demo :space_invader:

This is a tiny demo made by [Godot engine](https://godotengine.org/) to check what I learnt about Godot from scratch in 12 days, and definitely, to have fun :wink: The idea of this demo's UX and functionality design was inspired by a lot simulation or tycoon games.

#### Try it!
To try and maybe modify it then apply to your own project, you first need to download and install the open-source [Godot game engine](https://godotengine.org/download/windows). Then import the `project.godot` file into the engine. Then you can open and test the project in Godot.

Here's what I got as results:
Select the object from Item Menu, mouse left click on the available area on grid map to place a item. If overlapping detect, an alert massage will pop up and placement not allowed.
<br/>

![results showcase 01](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/001.gif)

<br/>
Press `delete` to change the cursor sprite to the trash bin icon, while the `delete` is pressed, mouse left click on an existed item will remove it from current grid map.
<br/>

![results showcase 02](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/002.gif)


<br/>
<br/>

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
<br/>

![item placement logics](https://github.com/yukihuyt/Grid_based_level_editor/blob/master/doc_resources/item_placement.png)

<br/>
<br/>

## What I learnt



