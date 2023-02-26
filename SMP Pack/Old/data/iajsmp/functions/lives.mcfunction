execute as @a run scoreboard players operation @s non_pvp_deaths -= @s pvp_deaths

execute as @a run scoreboard players operation @s lives += @s kills
execute as @a run scoreboard players operation @s lives -= @s pvp_deaths

execute as @a if score @s non_pvp_deaths matches 1.. at @s positioned ~-.5 ~ ~-.5 if entity @e[tag=rit_trap_active,dx=1,dy=-3,dz=1] run scoreboard players remove @s lives 1
execute as @a if score @s non_pvp_deaths matches 1.. at @s positioned ~-.5 ~ ~-.5 as @e[tag=rit_trap_active,dx=1,dy=-3,dz=1,limit=1,sort=nearest] run scoreboard players add @s lives 1
execute if entity @e[type=minecraft:armor_stand,scores={lives=1..}] run scoreboard objectives add uuid0 dummy
execute if entity @e[type=minecraft:armor_stand,scores={lives=1..}] run scoreboard objectives add uuid1 dummy
execute if entity @e[type=minecraft:armor_stand,scores={lives=1..}] run scoreboard objectives add uuid2 dummy
execute if entity @e[type=minecraft:armor_stand,scores={lives=1..}] run scoreboard objectives add uuid3 dummy
execute if entity @e[type=minecraft:armor_stand,scores={lives=1..}] as @a store result score @s uuid0 run data get entity @s UUID[0]
execute if entity @e[type=minecraft:armor_stand,scores={lives=1..}] as @a store result score @s uuid1 run data get entity @s UUID[1]
execute if entity @e[type=minecraft:armor_stand,scores={lives=1..}] as @a store result score @s uuid2 run data get entity @s UUID[2]
execute if entity @e[type=minecraft:armor_stand,scores={lives=1..}] as @a store result score @s uuid3 run data get entity @s UUID[3]
execute as @e[type=minecraft:armor_stand,scores={lives=1..}] store result score @s uuid0 run data get entity @s ArmorItems[0].tag.SkullOwner.Id[0]
execute as @e[type=minecraft:armor_stand,scores={lives=1..}] store result score @s uuid1 run data get entity @s ArmorItems[0].tag.SkullOwner.Id[1]
execute as @e[type=minecraft:armor_stand,scores={lives=1..}] store result score @s uuid2 run data get entity @s ArmorItems[0].tag.SkullOwner.Id[2]
execute as @e[type=minecraft:armor_stand,scores={lives=1..}] store result score @s uuid3 run data get entity @s ArmorItems[0].tag.SkullOwner.Id[3]

execute at @e[type=minecraft:armor_stand,scores={lives=1..}] as @a[scores={lives=1..}] if score @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] uuid0 = @s uuid0 if score @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] uuid1 = @s uuid1 if score @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] uuid2 = @s uuid2 if score @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] uuid3 = @s uuid3 run scoreboard players operation @s lives += @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] lives
execute at @e[type=minecraft:armor_stand,scores={lives=1..}] as @a[scores={lives=1..}] if score @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] uuid0 = @s uuid0 if score @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] uuid1 = @s uuid1 if score @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] uuid2 = @s uuid2 if score @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] uuid3 = @s uuid3 run scoreboard players set @e[type=minecraft:armor_stand,scores={lives=1..},limit=1,sort=nearest] lives 0

scoreboard objectives remove uuid0
scoreboard objectives remove uuid1
scoreboard objectives remove uuid2
scoreboard objectives remove uuid3

scoreboard players set @a kills 0
scoreboard players set @a pvp_deaths 0
scoreboard players set @a non_pvp_deaths 0


gamemode spectator @a[scores={lives=0},gamemode=survival]
gamemode survival @a[gamemode=spectator,scores={lives=1..}]



# scoreboard players add @a[scores={kills=1..}] lives 1
# execute if entity @a[scores={kills=1..}] run scoreboard players remove @a[scores={pvp_deaths=1}] lives 1
# scoreboard players remove @a[scores={kills=1..}] kills 1
# scoreboard players remove @a[scores={pvp_deaths=1..}] pvp_deaths 1