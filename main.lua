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

local sortableGroup = display.newSortableGroup()

for i = 1, 100 do

	local size = math.random( 20, 200 )
	local rect = display.newRect( sortableGroup, math.random( 0, 960 ), math.random( 0, 640 ), size, size )

end

-- Sort by one of various values
sortableGroup:setSort
{
--	property  = "x",
	property  = "y",
--	property  = "width",
--	direction = "bigger=nearer",
--	direction = "smaller=nearer",
}

-- Set a custom sort function (diagonal search - the further down right the nearer)
--sortableGroup:setSort( function( a, b ) return ( a.x + a.y ) < (b.x + b.y ) ; end )

-- Actually sort using the routine you specified
sortableGroup:sort()

-- Colour by order to show end result
local numChildren = sortableGroup.numChildren
for i = 1, numChildren do

	local col = i / numChildren
	sortableGroup[ i ]:setFillColor( col, col, 1 )

end
