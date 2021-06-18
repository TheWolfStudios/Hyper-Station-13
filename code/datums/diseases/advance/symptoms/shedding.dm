/*
//////////////////////////////////////
Alopecia

	Not Noticeable.
	Increases resistance slightly.
	Increases stage speed.
	Transmittable.
	Intense Level.

BONUS
	Makes the mob lose hair.

//////////////////////////////////////
*/

/datum/symptom/shedding
	name = "Alopecia"
	desc = "The virus causes rapid shedding of head and body hair. Or it would, but now it just gives people socks. Who knows."
	stealth = 0
	resistance = 1
	stage_speed = 2
	transmittable = 2
	level = 4
	severity = 1
	base_message_chance = 50
	symptom_delay_min = 45
	symptom_delay_max = 90

/datum/symptom/shedding/Activate(datum/disease/advance/A)
	if(!..())
		return

	var/mob/living/M = A.affected_mob
	if(prob(base_message_chance))
		to_chat(M, "<span class='warning'>[pick("Your scalp itches.", "Your skin feels flaky.")]</span>")
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		switch(A.stage)
			if(5)
				if(H.socks != "Stockings - Programmer")
					H.socks = "Stockings - Programmer"
					H.update_body(0)
					H.visible_message("<span class='warning'>[H] seems to have gained some socks...</span>", "<span class='notice'>You suddenly feel that you're wearing socks.</span>")

/datum/symptom/shedding/proc/Shed(mob/living/carbon/human/H, fullbald)
	if(fullbald)
		H.facial_hair_style = "Shaved"
		H.hair_style = "Bald"
	else
		H.hair_style = "Balding Hair"
	H.update_hair()
