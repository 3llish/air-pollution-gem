require 'net/http'
require 'json'

class AirGem
	
	@token

	def initialize(token)
		@token = token
	end

	def city(cityname)
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/feed/#{cityname}/?token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	def here
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/feed/here/?token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	def geo(latitude, longitude)
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/feed/geo:#{latitude};#{longitude}/?token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	def geo(latitude, longitude)
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/feed/geo:#{latitude};#{longitude}/?token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	def map(latitude_min, longitude_min, latitude_max, longitude_max)
		latlng = latitude_min.to_s + longitude_min.to_s + latitude_max.to_s + longitude_max.to_s
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/map/bounds/?token=#{@token}&latlng=#{latlng}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end

	def search(keyword)
		data = JSON.parse(Net::HTTP.get('api.waqi.info', "/search/?keyword=#{keyword}&token=#{@token}"))
		if data['status'] == 'error'
			raise data['data']
		else
			return data
		end
	end
	
end