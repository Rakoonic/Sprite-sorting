------------------------------------------------------------------------------
-- SORTABLE GROUPS
------------------------------------------------------------------------------

local setSort, sort

------------------------------------------------------------------------------
-- ADDED CONSTRUCTION FUNCTION
------------------------------------------------------------------------------

-- Create the new group type
function display.newSortableGroup( params )

	local self = display.newGroup()

	-- Add in the extra function
	self.sort    = sort
	self.setSort = setSort

	-- If sorting params are passed, set them up
	if params then self:setSort( params ) ; end

	-- Return the group
	return self

end

------------------------------------------------------------------------------
-- SORTABLE GROUPS
------------------------------------------------------------------------------

function setSort( self, params )

	-- What type of sort function is it?
	if type( params ) == "function" then
		self.sortFunction  = params
	else
		local property  = params.property or "y"
		local direction = params.direction or "bigger=nearer"
		if direction == "smaller=nearer" then self.sortFunction = function( a, b ) return a[ property ] > b[ property ] ; end
		else                                  self.sortFunction = function( a, b ) return a[ property ] < b[ property ] ; end ; end
	end

end

function sort( self, params )

	-- Remove all of the objects in the group, maintaining the same order to keep it quick
	local temp = {}
	local objs = self.numChildren
	for i = 1, objs do
		temp[ i ] = self[ i ]
	end
	for i = self.numChildren, 1, -1 do
		self[ i ] = nil
	end

	-- Sort them
	table.sort( temp, self.sortFunction )

	-- Reinsert into the group
	for i = 1, #temp, 1 do
		self:insert( temp[ i ] )
	end

end
