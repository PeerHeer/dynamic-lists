#> iterator/iterate_start.mcfucntion
# Initializes and destorys the iterator.
#
#> Arguments:
#   #nbtlist.iterator.operation nbtlist.var: the type of operation to execute.
#
#> Returns:
#   nbtlist:result List: the list resulting from the operation.
#   nbtlist:result Success: 1b if the operation was successful, 0b otherwise.

# Initialize index, success and stop variables.
scoreboard players set #nbtlist.iterator.index nbtlist.var -1
scoreboard players set #nbtlist.operation.result.success nbtlist.var 0
scoreboard players set #nbtlist.iterator.stop nbtlist.var 0

# Reset the nbtlist:result storage to clear results for the operation.
function nbtlist:setup/storage/result

# Load the list to iterate over into Iterable.
data modify storage nbtlist:iterator Iterable set from storage nbtlist:args List

# Check type of operation and load the appropriate arguments.
# Execute operation immediately if it is append or prepend.
# 0: append
# 1: prepend
# 2: insert
# 3: delete
# 4: lookup
# 5: extend
# 6: reverse
# 7: sort
execute if score #nbtlist.iterator.operation nbtlist.var matches 0 run function nbtlist:operations/append/append_to_list
execute if score #nbtlist.iterator.operation nbtlist.var matches 1 run function nbtlist:operations/prepend/prepend_to_list
execute if score #nbtlist.iterator.operation nbtlist.var matches 2 run function nbtlist:operations/insert/get_args
execute if score #nbtlist.iterator.operation nbtlist.var matches 3 run function nbtlist:operations/delete/get_args
execute if score #nbtlist.iterator.operation nbtlist.var matches 4 run function nbtlist:operations/lookup/get_args

# Start iteration if the operation is not append or prepend.
execute if score #nbtlist.iterator.operation nbtlist.var matches 2.. run function nbtlist:iterator/iterate

# Return the resulting list.
data modify storage nbtlist:result List set from storage nbtlist:iterator ResultList
# Return the success of the operation.
execute store result storage nbtlist:result Success byte 1.0 run scoreboard players get #nbtlist.operation.result.success nbtlist.var

# Reset nbtlist:args storage.
function nbtlist:setup/storage/args

# Reset the nbtlist:iterator storage.
data modify storage nbtlist:iterator Iterable set from storage nbtlist:format Iterator.Iterable
data modify storage nbtlist:iterator ResultList set from storage nbtlist:format Iterator.ResultList
data remove storage nbtlist:iterator Args

# Reset the operation type.
scoreboard players reset #nbtlist.iterator.operation nbtlist.var