require 'net/http'
require 'json'

class Pollution
	
	@token

	##
	# => Initialize the Pollution class and set the token variable.
	##
	def initialize(token)
		@token = token
	end

	##
	# => Returns the air pollution data of the given city or throws an error if the city wasn't found.
	##

	def city(cityname)
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/feed/#{cityname}/?token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	##
	# => Returns the air pollution data of the current location (IP Based).
	##

	def here
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/feed/here/?token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	##
	# => Returns the air pollution data of the given coordinates.
	##

	def geo(latitude, longitude)
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/feed/geo:#{latitude};#{longitude}/?token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	##
	# => Returns the air pollution data of the area between the given coordinates. This method takes 4 arguments: Latitude 1, Longitude 1, Latitude 2, Longitude 2.
	##

	def map(latitude_min, longitude_min, latitude_max, longitude_max)
		latlng = latitude_min.to_s + longitude_min.to_s + latitude_max.to_s + longitude_max.to_s
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/map/bounds/?token=#{@token}&latlng=#{latlng}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	##
	# => Returns data about stations near the searched keyword.
	##

	def search(keyword)
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/search/?keyword=#{keyword}&token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

end