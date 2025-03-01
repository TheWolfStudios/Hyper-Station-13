//predominantly positive traits
//this file is named weirdly so that positive traits are listed above negative ones

/datum/quirk/alcohol_tolerance
	name = "Alcohol Tolerance"
	desc = "You become drunk more slowly and suffer fewer drawbacks from alcohol."
	value = 1
	category = CATEGORY_ALCOHOL
	mob_trait = TRAIT_ALCOHOL_TOLERANCE
	gain_text = "<span class='notice'>You feel like you could drink a whole keg!</span>"
	lose_text = "<span class='danger'>You don't feel as resistant to alcohol anymore. Somehow.</span>"
	medical_record_text = "Patient demonstrates a high tolerance for alcohol."

/datum/quirk/apathetic
	name = "Apathetic"
	desc = "You just don't care as much as other people. That's nice to have in a place like this, I guess."
	value = 1
	category = CATEGORY_MOODS
	mob_trait = TRAIT_APATHETIC
	mood_quirk = TRUE
	medical_record_text = "Patient was administered the Apathy Evaluation Scale but did not bother to complete it."

/datum/quirk/apathetic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier = 0.8

/datum/quirk/apathetic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier = 1 //Change this once/if species get their own mood modifiers.

/datum/quirk/drunkhealing
	name = "Drunken Resilience"
	desc = "Nothing like a good drink to make you feel on top of the world. Whenever you're drunk, you slowly recover from injuries."
	value = 2
	category = CATEGORY_ALCOHOL
	mob_trait = TRAIT_DRUNK_HEALING
	gain_text = "<span class='notice'>You feel like a drink would do you good.</span>"
	lose_text = "<span class='danger'>You no longer feel like drinking would ease your pain.</span>"
	medical_record_text = "Patient has unusually efficient liver metabolism and can slowly regenerate wounds by drinking alcoholic beverages."

/datum/quirk/empath
	name = "Empath"
	desc = "Whether it's a sixth sense or careful study of body language, it only takes you a quick glance at someone to understand how they feel."
	value = 2
	category = CATEGORY_MOODS
	mob_trait = TRAIT_EMPATH
	gain_text = "<span class='notice'>You feel in tune with those around you.</span>"
	lose_text = "<span class='danger'>You feel isolated from others.</span>"
	medical_record_text = "Patient is highly perceptive of and sensitive to social cues, or may possibly have ESP. Further testing needed."

/datum/quirk/freerunning
	name = "Freerunning"
	desc = "You're great at quick moves! You can climb tables more quickly."
	value = 2
	category = CATEGORY_MOVEMENT
	mob_trait = TRAIT_FREERUNNING
	gain_text = "<span class='notice'>You feel lithe on your feet!</span>"
	lose_text = "<span class='danger'>You feel clumsy again.</span>"
	medical_record_text = "Patient scored highly on cardio tests."

/datum/quirk/friendly
	name = "Friendly"
	desc = "You give the best hugs, especially when you're in the right mood."
	value = 1
	category = CATEGORY_MOODS
	mob_trait = TRAIT_FRIENDLY
	gain_text = "<span class='notice'>You want to hug someone.</span>"
	lose_text = "<span class='danger'>You no longer feel compelled to hug others.</span>"
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates low-inhibitions for physical contact and well-developed arms. Requesting another doctor take over this case."

/datum/quirk/jolly
	name = "Jolly"
	desc = "You sometimes just feel happy, for no reason at all."
	value = 1
	category = CATEGORY_MOODS
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates constant euthymia irregular for environment. It's a bit much, to be honest."

/datum/quirk/jolly/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "jolly", /datum/mood_event/jolly)

/datum/quirk/light_step
	name = "Light Step"
	desc = "You walk with a gentle step; stepping on sharp objects is quieter, less painful and you won't leave footprints behind you."
	value = 1
	category = CATEGORY_MOVEMENT
	mob_trait = TRAIT_LIGHT_STEP
	gain_text = "<span class='notice'>You walk with a little more litheness.</span>"
	lose_text = "<span class='danger'>You start tromping around like a barbarian.</span>"
	medical_record_text = "Patient's dexterity belies a strong capacity for stealth."

/datum/quirk/quick_step
	name = "Quick Step"
	desc = "You walk with determined strides, and out-pace most people when walking."
	value = 2
	category = CATEGORY_MOVEMENT
	mob_trait = TRAIT_SPEEDY_STEP
	gain_text = "<span class='notice'>You feel determined. No time to lose.</span>"
	lose_text = "<span class='danger'>You feel less determined. What's the rush, man?</span>"
	medical_record_text = "Patient scored highly on racewalking tests."

/datum/quirk/musician
	name = "Musician"
	desc = "You can tune handheld musical instruments to play melodies that clear certain negative effects and soothe the soul."
	value = 1
	category = CATEGORY_ITEMS
	mob_trait = TRAIT_MUSICIAN
	gain_text = "<span class='notice'>You know everything about musical instruments.</span>"
	lose_text = "<span class='danger'>You forget how musical instruments work.</span>"
	medical_record_text = "Patient brain scans show a highly-developed auditory pathway."

/datum/quirk/musician/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/instrument/guitar/guitar = new(get_turf(H))
	var/list/instrument_slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS,
	)
	H.equip_in_one_of_slots(guitar, instrument_slots, qdel_on_fail = TRUE)
	var/obj/item/musicaltuner/musicaltuner = new(get_turf(H))
	var/list/tuner_slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE
	)
	H.equip_in_one_of_slots(musicaltuner, tuner_slots, qdel_on_fail = TRUE)
	H.regenerate_icons()

/datum/quirk/night_vision
	name = "Night Vision"
	desc = "You can see slightly more clearly in full darkness than most people."
	value = 1
	category = CATEGORY_BODY
	mob_trait = TRAIT_NIGHT_VISION
	gain_text = "<span class='notice'>The shadows seem a little less dark.</span>"
	lose_text = "<span class='danger'>Everything seems a little darker.</span>"

/datum/quirk/night_vision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/eyes/eyes = H.getorgan(/obj/item/organ/eyes)
	if(!eyes || eyes.lighting_alpha)
		return
	eyes.Insert(H) //refresh their eyesight and vision

/datum/quirk/photographer
	name = "Photographer"
	desc = "You know how to handle a camera, shortening the delay between each shot."
	value = 1
	category = CATEGORY_ITEMS
	mob_trait = TRAIT_PHOTOGRAPHER
	gain_text = "<span class='notice'>You know everything about photography.</span>"
	lose_text = "<span class='danger'>You forget how photo cameras work.</span>"
	medical_record_text = "Patient mentions photography as a stress-relieving hobby."

/datum/quirk/photographer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/camera/camera = new(get_turf(H))
	var/list/camera_slots = list (
		"neck" = ITEM_SLOT_NECK,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE,
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS
	)
	H.equip_in_one_of_slots(camera, camera_slots, qdel_on_fail = TRUE)
	H.regenerate_icons()

/datum/quirk/selfaware
	name = "Self-Aware"
	desc = "You know your body well, and can accurately assess the extent of your wounds."
	value = 2
	category = CATEGORY_HEALTH
	mob_trait = TRAIT_SELF_AWARE
	medical_record_text = "Patient demonstrates an uncanny knack for self-diagnosis."

/datum/quirk/skittish
	name = "Skittish"
	desc = "You can conceal yourself in danger. Ctrl-shift-click a closed locker to jump into it, as long as you have access."
	value = 2
	category = CATEGORY_GAMEPLAY
	mob_trait = TRAIT_SKITTISH

/datum/quirk/spiritual
	name = "Spiritual"
	desc = "You're in tune with the gods, and your prayers may be more likely to be heard. Or not."
	value = 1
	category = CATEGORY_GAMEPLAY
	mob_trait = TRAIT_SPIRITUAL
	gain_text = "<span class='notice'>You feel a little more faithful to the gods today.</span>"
	lose_text = "<span class='danger'>You feel less faithful in the gods.</span>"
	medical_record_text = "Patient reports a belief in a higher power."

/datum/quirk/tagger
	name = "Tagger"
	desc = "You're an experienced artist. While drawing graffiti, you can get twice as many uses out of drawing supplies."
	value = 1
	category = CATEGORY_ITEMS
	mob_trait = TRAIT_TAGGER
	gain_text = "<span class='notice'>You know how to tag walls efficiently.</span>"
	lose_text = "<span class='danger'>You forget how to tag walls properly.</span>"
	medical_record_text = "Patient was recently seen for possible paint huffing incident."

/datum/quirk/tagger/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/toy/crayon/spraycan/spraycan = new(get_turf(H))
	var/list/spray_slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE
	)
	H.equip_in_one_of_slots(spraycan, spray_slots, qdel_on_fail = TRUE)
	H.regenerate_icons()

/datum/quirk/voracious
	name = "Voracious"
	desc = "Nothing gets between you and your food. You eat twice as fast as everyone else!"
	value = 1
	category = CATEGORY_FOOD
	mob_trait = TRAIT_VORACIOUS
	gain_text = "<span class='notice'>You feel HONGRY.</span>"
	lose_text = "<span class='danger'>You no longer feel HONGRY.</span>"
	medical_record_text = "Patient demonstrates a disturbing capacity for eating."

/datum/quirk/trandening
	name = "High Luminosity Eyes"
	desc = "When the next big fancy implant came out you had to buy one on impluse!"
	value = 1
	category = CATEGORY_BODY
	gain_text = "<span class='notice'>You have to keep up with the next big thing!.</span>"
	lose_text = "<span class='danger'>High-tech gizmos are a scam...</span>"

/datum/quirk/trandening/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/autosurgeon/gloweyes/gloweyes = new(get_turf(H))
	var/list/gloweye_slots = list (
		"backpack" = SLOT_IN_BACKPACK,
		"hands" = SLOT_HANDS,
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE
	)
	H.equip_in_one_of_slots(gloweyes, gloweye_slots, qdel_on_fail = TRUE)
	H.regenerate_icons()

/datum/quirk/bloodpressure
	name = "Polycythemia vera"
	desc = "You've a treated form of Polycythemia vera that increases the total blood volume inside of you as well as the rate of replenishment!"
	value = 2 //I honeslty dunno if this is a good trait? I just means you use more of medbays blood and make janitors madder, but you also regen blood a lil faster.
	category = CATEGORY_HEALTH
	mob_trait = TRAIT_HIGH_BLOOD
	gain_text = "<span class='notice'>You feel full of blood!</span>"
	lose_text = "<span class='notice'>You feel like your blood pressure went down.</span>"
	medical_record_text = "Patient's blood tests report an abnormal concentration of red blood cells in their bloodstream."

/datum/quirk/bloodpressure/add()
	quirk_holder.blood_ratio = 1.2
	quirk_holder.blood_volume += 150

/datum/quirk/bloodpressure/remove()
	if(quirk_holder)
		quirk_holder.blood_ratio = 1

/datum/quirk/low_pressure_lungs
	name = "Low Pressure Lungs"
	desc = "You're not quite used to the high air pressure! Perfect for those adapted to the air of Lavaland or on Asteroids!"
	value = -1
	category = CATEGORY_BODY
	mob_trait = TRAIT_LOW_PRESSURE_LUNGS
	var/slot_string = "lungs"
	var/specific = null
	gain_text = "<span class='notice'>You feel your lungs taking in more air.</span>"
	lose_text = "<span class='notice'>You feel like the air is not as plentiful.</span>"
	medical_record_text = "During physical examination, patient was found to have lungs adapted to low pressure environments."

/datum/quirk/low_pressure_lungs/post_add()
	to_chat(quirk_holder, "<span class='boldannounce'>Your [slot_string] feel the heavy pressure of the air.</span>")

/datum/quirk/low_pressure_lungs/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/mask/breath/breath = new(get_turf(H))
	var/list/breth = list ( //shu-ut up, Brethyyyy.
		"face" = SLOT_WEAR_MASK
	)
	H.equip_in_one_of_slots(breath, breth, qdel_on_fail = FALSE)

	var/obj/item/tank/internals/emergency_oxygen/emergency_oxygen = new(get_turf(H))
	var/list/oxy_tank = list (
		"left pocket" = SLOT_L_STORE,
		"right pocket" = SLOT_R_STORE,
		"hands" = SLOT_HANDS
	)
	emergency_oxygen.air_contents.gases[/datum/gas/oxygen] = (6*ONE_ATMOSPHERE)*6/(R_IDEAL_GAS_EQUATION*T20C)
	H.equip_in_one_of_slots(emergency_oxygen, oxy_tank, qdel_on_fail = FALSE)
	H.internal = H.get_item_for_held_index(2)
	H.update_internals_hud_icon(1)
	H.regenerate_icons()

/datum/quirk/tough
	name = "Tough"
	desc = "Your body is abnormally enduring and can take 10% more damage."
	value = 2
	category = CATEGORY_HEALTH
	mob_trait = TRAIT_TOUGH
	medical_record_text = "Patient has an abnormally high capacity for injury."
	gain_text = "<span class='notice'>You feel very sturdy.</span>"
	lose_text = "<span class='notice'>You feel less sturdy.</span>"
	var/healthchange = 0

/datum/quirk/tough/add()
	var/mob/living/carbon/human/H = quirk_holder
	healthchange = H.maxHealth * 0.1
	H.maxHealth = H.maxHealth * 1.1

/datum/quirk/tough/remove()
	var/mob/living/carbon/human/H = quirk_holder
	H.maxHealth += healthchange

/datum/quirk/draconicspeaker
	name = "Draconic speaker"
	desc = "Due to your time spent around lizards, you can speak Draconic!"
	value = 1
	category = CATEGORY_LANGUAGES
	gain_text = "<span class='notice'>You feel sensitive to hissing noises and your tongue curls comfortably.</span>"
	lose_text = "<span class='notice'>You forget how to speak Draconic!</span>"

/datum/quirk/draconicspeaker/add()
	var/mob/living/M = quirk_holder
	M.grant_language(/datum/language/draconic)

/datum/quirk/draconicspeaker/remove()
	var/mob/living/M = quirk_holder
	M?.remove_language(/datum/language/draconic)

/datum/quirk/slimespeaker
	name = "Slime speaker"
	desc = "Due to your time spent around slimes, you can speak Slimespeak!"
	value = 1
	category = CATEGORY_LANGUAGES
	gain_text = "<span class='notice'>You feel sensitive to blorbling noises, and your throat produces melodic sounds.</span>"
	lose_text = "<span class='notice'>You forget how to speak Slimespeak!</span>"

/datum/quirk/slimespeaker/add()
	var/mob/living/M = quirk_holder
	M.grant_language(/datum/language/slime)

/datum/quirk/slimespeaker/remove()
	var/mob/living/M = quirk_holder
	M?.remove_language(/datum/language/slime)

/datum/quirk/tajaspeaker
	name = "Siik-Tajr speaker"
	desc = "Due to your time spent around Tajaran, you can speak their native tongue!"
	value = 1
	category = CATEGORY_LANGUAGES
	gain_text = "<span class='notice'>You feel sensitive to mrowls and your tongue curls comfortably.</span>"
	lose_text = "<span class='notice'>You forget how to speak Siik'Tajr!</span>"

/datum/quirk/tajaspeaker/add()
	var/mob/living/M = quirk_holder
	M.grant_language(/datum/language/tajara)

/datum/quirk/tajaspeaker/remove()
	var/mob/living/M = quirk_holder
	M?.remove_language(/datum/language/tajara)

/datum/quirk/russianspeaker
	name = "Neo-Russkiya speaker"
	desc = "Due to your time spent around space russians, you can speak Neo-Russkiya!"
	value = 1
	category = CATEGORY_LANGUAGES
	gain_text = "<span class='notice'>You feel sensitive to the motherland, blyat!</span>"
	lose_text = "<span class='notice'>You forget how to speak Neo-Russkiya!</span>"

/datum/quirk/russianspeaker/add()
	var/mob/living/M = quirk_holder
	M.grant_language(/datum/language/spacerussian)

/datum/quirk/russianspeaker/remove()
	var/mob/living/M = quirk_holder
	M?.remove_language(/datum/language/spacerussian)
