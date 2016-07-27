require "getswift/version"
require "httparty"

module Getswift
	include HTTparty

	def self.get_it_delivered(dropoff_address, items, user_name, user_phone)
		#dropoffAddress = "#{current_user.street_address}, #{current_user.city}, #{current_user.postal_code}, #{current_user.province}"
		HTTParty.post("https://app.getswift.co/api/v2/deliveries",
		      {
		          :body => {
		                "apiKey": ENV["swift_api_key"],
		                "booking":{
		                    "items": items,
		                    "pickupDetail": {
		                        "name": "Merchant Name",
		                        "phone": "Merchant Number",
		                        "address": "375 Water Street, Vancouver, BC V6B 5C6"
		                    },
		                    "dropoffDetail": {
		                        "name": user_name,
		                        "phone": user_phone,
		                        "address": dropoff_address
		                    }
		                }
		            }.to_json,  
		          :headers => { 'Content-Type' => 'application/json' }
		      }
		  )
	end

	
end
