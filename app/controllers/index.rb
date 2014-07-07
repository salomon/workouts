get '/' do
  erb :index
end

get '/workout' do

	quads = ['squats', 'box jumps', 'step ups', 'bosu squats', 'burpee box jumps',
			'broad jumps', 'squat clean', 'bulgarian squats']
	hamstrings = ['ball roll-ins', '3-way lunge with sliders', 'horse kicks', 'dumbbell lunges', 'lunges',
				  'single leg dumbbell deadlift', 'alternating pistol squats']
	chest = ['push ups', 'dips', 'chest flys', 'spiderman pushups', 'bench press']
	back = ['overhand pull ups', 'rows', 'sidehand pullups', 'underhand pullups',
			'elevated rows', 'alternating dumbbell plank row (optional: with push up)',
			'back extensions']
	abs = ['jack knifes', 'side planks', 'lower ab lifts', 'windshield wipers', 'planks', 'sit ups', 'v sit ups']
	calves = ['calf raises', 'jump rope', 'hurdles']
	stability = ['air pads']
	cardio = ['mountain climbers', 'burpees', 'battle rope', 'footwork on bosu ball']
	shoulders = ['shoulder push press', 'resistance punch']
	arms = ['rope climb', 'tricep dip on pvc pipe']
	whole_body = ['bottom up press', 'squat snatch', 'turkish getups', 'hells wind staff',
				  'hang power snatch', 'wall ball', 'kettlebell swing']
	agility = ['ladder', 'stairs', 'jump rope']
	other = ['rotating lunges with ball']
	boxing = ['boxing']
	swimming = ['swimming']
	run = ['distance run']
	track = ['track workout']
	basketball = ['basketball workout']

	def pair(big_array,small_array)
		case small_array
		when big_array[0]
			exercise = big_array[1].sample
		when big_array[1]
			exercise = big_array[0].sample
		when big_array[2]
			exercise = big_array[3].sample
		when big_array[3]
			exercise = big_array[2].sample
		end
		exercise
	end


	workouts = [quads, hamstrings, chest, back, abs, calves, stability, cardio, shoulders, arms, whole_body, agility, other, boxing, swimming, run, track, basketball]
	todays_workout = Array.new
	sport_check = workouts.sample
	if sport_check == boxing || sport_check == swimming || sport_check == run || sport_check == track || sport_check == basketball
		todays_workout << sport_check[0]
		workouts.unshift(4)
	else
		exercise = abs.sample
		todays_workout << exercise
		abs.delete(exercise)

		while todays_workout.length < 6
			if todays_workout.length == 5
				current_workout = [abs, calves, stability, cardio].sample
				exercise = current_workout.sample
				todays_workout << exercise
				current_workout.delete(exercise)
			else
				current_workout = workouts.sample
				exercise = current_workout.sample
				todays_workout << exercise
				current_workout.delete(exercise)
				if current_workout == quads || current_workout == hamstrings || current_workout == chest || current_workout == back
					exercise = pair(workouts, current_workout)
					todays_workout << exercise
					current_workout.delete(exercise)
				end
			end 
		end


	end




	@todays_workout = todays_workout
	erb :workout
#now we have the first exercise for today's workouts
#lets check which body part it's from

end
