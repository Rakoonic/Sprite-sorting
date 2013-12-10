Sprite-sorting
==============

New display groups with the ability to sort the sprites within them by user specified parameters.

Setting up
----------

Just require the 'sortable_group' group.
You only need to do it once, and you don't need to store the value returned, as requiring merely extends the standard 'display' object as needed.

Creating a new sortable group
-----------------------------

local sortableGroup = display.newSortableGroup()

The created sortable group works as a normal display group.

Specifying the sort order
-------------------------

There are two ways of specifying how the children of the group sort.
You can either supply your own sort function, or specify a property that each child has, and a sort direction.

To supply your own sort function you would do:

sortableGroup:setSort( function( a, b ) return ( a.x + a.y ) < (b.x + b.y ) ; end )

The above example sorts things according to how far down and right the children are, with the further down and right the child is, the nearer it is drawn.

To supply a parameter and direction you would do:

sortableGroup:setSort{
   property = "y",
   direction = "bigger=nearer",
}

The value for property ("y" in this example) can be any property that each child has.
If no property is supplied, "y" is used.

The value for direction can either be "bigger=nearer" or "smaller=nearer", which specifies in what direction to sort the relative values.
The default for this is "bigger=nearer", meaning if you call setSort() without parameters, it defaults to sorting sprites by their Y value, lower down being nearer.

Sorting the group
-----------------

sortableGroup:sort()

Call this whenever necessary.
You should avoid calling it when not needed, although the overhead should be minimal.
