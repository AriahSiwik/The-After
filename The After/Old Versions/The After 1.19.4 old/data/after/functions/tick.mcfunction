#execute as @a[nbt={Dimension:"after:the_after"},tag=!after_in_water] at @s if block ~ ~ ~ minecraft:water run tag @s add after_in_water
#execute as @a[nbt={Dimension:"after:the_after"},tag=after_in_water] at @s unless block ~ ~ ~ minecraft:water run tag @s add after_out_of_water

#tag @a[tag=after_out_of_water] remove after_in_water
#effect clear @a[tag=after_out_of_water] nausea
#tag @a[tag=after_out_of_water] remove after_out_of_water

#effect give @a[tag=after_in_water] nausea 9999 4

execute as @e[nbt={ActiveEffects:[{Id:11, Amplifier:69b}]}] at @s run spreadplayers ~ ~ 180 200 false @s

execute as @a[nbt={Dimension:"after:the_after"}] at @s if block ~ ~ ~ minecraft:water run effect give @s nausea 4 0 true