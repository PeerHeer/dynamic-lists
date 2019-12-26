# Author: PeerHeer
#
# Deletes an index from a list and returns the deleted element.

# Get the length of the list first.
function dynalist.private:internal/length

# Convert the index from negative to positive if applicable.
scoreboard players operation $dynalist.iterator.index dynalist.var = $dynalist.length dynalist.var
execute if score $dynalist.index dynalist.in matches ..-1 run scoreboard players operation $dynalist.iterator.index dynalist.var += $dynalist.index dynalist.in
execute if score $dynalist.index dynalist.in matches 0.. run scoreboard players operation $dynalist.iterator.index dynalist.var = $dynalist.index dynalist.in

# Start the iteration if the index is valid.
execute unless score $dynalist.iterator.index dynalist.var matches ..-1 unless score $dynalist.iterator.index dynalist.var >= $dynalist.length dynalist.var run function dynalist.private:operations/pop/iterate_start

# If the index is invalid, return failure.
execute if score $dynalist.iterator.index dynalist.var matches ..-1 run scoreboard players set $dynalist.success dynalist.out 0
execute if score $dynalist.iterator.index dynalist.var >= $dynalist.length dynalist.var run scoreboard players set $dynalist.success dynalist.out 0