execute as @a run scoreboard players add @s afk.time 1

execute as @a store result score @s afk.p1 run data get entity @s Rotation[0]
execute as @a store result score @s afk.y1 run data get entity @s Rotation[1]

execute as @a unless score @s afk.p0 = @s afk.p1 run scoreboard players set @s afk.time 0
execute as @a unless score @s afk.y0 = @s afk.y1 run scoreboard players set @s afk.time 0

execute as @a store result score @s afk.p0 run scoreboard players get @s afk.p1
execute as @a store result score @s afk.y0 run scoreboard players get @s afk.y1

execute as @a[team=!afk,scores={afk.time=3600..}] run team join afk
execute as @a[team=afk,scores={afk.time=..3599}] run team leave @s

execute as @a[tag=afk_kick] run tag @s remove afk_kick
execute as @a[scores={afk.time=18000..}] run tag @s add afk_kick
execute as @a[tag=afk_kick] run scoreboard players set @s afk.time 0
execute as @a[tag=afk_kick] run kick @s You've been AFK for too long!