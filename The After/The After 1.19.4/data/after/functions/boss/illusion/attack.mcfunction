#Summon a Marker for each possible attack
summon marker ~ ~ ~ {Tags:["atk_possible","atk_illusion_clone"]}

#Pick an attack and kill all but the chosen Marker
tag @e[tag=atk_possible,limit=1,sort=random] add atk_chosen
tag @e[tag=atk_chosen] remove atk_possible
kill @e[tag=atk_possible]

#Call a function depending on remaining attack
execute as @e[tag=atk_illusion_clone] at @s run function after:boss/illusion/attacks/clone


scoreboard players set @s timer 0