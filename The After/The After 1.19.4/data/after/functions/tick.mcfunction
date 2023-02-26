#execute as @a[nbt={Dimension:"after:the_after"},tag=!after_in_water] at @s if block ~ ~ ~ minecraft:water run tag @s add after_in_water
#execute as @a[nbt={Dimension:"after:the_after"},tag=after_in_water] at @s unless block ~ ~ ~ minecraft:water run tag @s add after_out_of_water

#tag @a[tag=after_out_of_water] remove after_in_water
#effect clear @a[tag=after_out_of_water] nausea
#tag @a[tag=after_out_of_water] remove after_out_of_water

#effect give @a[tag=after_in_water] nausea 9999 4

execute as @e[nbt={ActiveEffects:[{Id:11, Amplifier:69b}]}] at @s run spreadplayers ~ ~ 180 200 false @s 

execute as @a[nbt={Dimension:"after:the_after"}] at @s if block ~ ~ ~ minecraft:water run effect give @s nausea 4 0 true

execute as @e[type=marker,tag=spire_center,tag=!spire_summoned] at @s positioned ~-9 ~-9 ~-9 if entity @a[dx=18,dy=20,dz=18] at @s run function after:boss/summon

function after:boss/tick

execute as @e[scores={timer=-2147483648..2147483647}] run scoreboard players add @s timer 1
#/execute positioned ~-50 ~ ~-50 if entity @e[type=zombie,dy=0,dx=100,dz=100]