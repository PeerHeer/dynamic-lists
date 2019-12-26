# Author: PeerHeer
#
# Initialize the iterator.

# Initialize scores.
scoreboard players set $dynalist.result dynalist.out 0

# Set iterable length.
scoreboard players operation $dynalist.iterator.length dynalist.var = $dynalist.length dynalist.var

# Copy the list into the iterator.
data modify storage dynalist.private:iterator Root.Iterable set from storage dynalist:in List

# Copy data to DataR for comparison.
data modify storage dynalist.private:compare Root.DataR set from storage dynalist:in Data