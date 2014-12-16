module ApplicationHelper

	#this is where the User's selection -- 'station'-- will compared with the API data -- 'results'
	def hash_and_msg_generator(results, station)
		#we will have a couple messages to tell the user whether or not a bus is coming soon
		  @message = ""

		#we want to provide the user with the Route and Vehicle numbers for the approaching bus(es). the best way to save two related items is in a hash!
		@buses = {}
		results.each do |result|
			if result["TIMEPOINT"].include?station
				@buses[result["ROUTE"]]= result["VEHICLE"]
				#the Route is the key and the vehicle is the value
			end

		end
		if @buses.count==0
			#no buses have the User's station as their next stop
			@message = "Sorry, it's gonna be a while."
		elsif @buses.count == 1
			#one bus will be making the connection to the User's station
			@message = "A bus is on its way!"
		elsif @buses.count > 1
			@message  = "These buses will be coming soon:"
		else
			#just in case there is a negative number
			@message  = "Oops... I think there was a slight error"
		end

	end
end
