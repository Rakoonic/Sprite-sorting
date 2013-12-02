------------------------------------------------------------------------------
-- SET UP
------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
system.activate("multitouch")

-- Add in the sortable group
require( "libs.sortable_group" )

------------------------------------------------------------------------------
-- CREATE AND TEST
------------------------------------------------------------------------------

-- Create sortable group and sort by one of various values
local sortableGroup = display.newSortableGroup{

	-- What property controls the Z? Can be a standard one or a value you add to each sprite (for example, a 'Z' property)
--	property  = "x",
	property  = "y",
--	property  = "width",

	-- Which direction to sort in?
--	direction = "bigger=nearer",
--	direction = "smaller=nearer",	
}

--[[
-- Create sortable group and set a custom sort function (diagonal search - the further down right the nearer)
local sortableGroup = display.newSortableGroup(
	function( a, b )
		return ( a.x + a.y ) < (b.x + b.y )
	end
)
--]]

-- Create objects to attempt to sort
for i = 1, 100 do

	local size = math.random( 20, 200 )
	local rect = display.newRect( sortableGroup, math.random( 0, 960 ), math.random( 0, 640 ), size, size )

end

-- Actually sort using the routine you specified
sortableGroup:sort()

-- Colour by order to show end result
local numChildren = sortableGroup.numChildren
for i = 1, numChildren do

	local col = i / numChildren
	sortableGroup[ i ]:setFillColor( col, col, 1 )

end
