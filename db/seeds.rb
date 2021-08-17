# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	
	def appsecret_encryption
		appsecret = '7b99f2c7f85f148c57d9ed4cd1bdcd3d59a99a1666b0af6395f8fd1d22f2f001'
		payload = {"namespace_id":1}
		jwt_appsecret = JWT.encode payload, appsecret, 'HS256'
		all_authorization = "f4f34a327fb4e2d5e87e5622f8ebb4cc45c7a8212650ebf2b95314f5170f0418:#{jwt_appsecret}"
	end
	id = 1
	12.times do
			
		dates = RestClient::Request.execute(method: :get, url: "https://gxhz.cdht.gov.cn/api/v4/forms/86/responses?page=#{id}", headers: {Authorization: appsecret_encryption})
		dates_convert_to_jsons = JSON.parse(dates)	
		dates_convert_to_jsons.each do |d|
				
			form = VaccinationForm.new
			form.company =	d['mapped_values']['company']['text_value'].join()
			form.number = d['mapped_values']['number']['text_value'].join()
			form.nonumber = d['mapped_values']['nonumber']['text_value'].join()
			form.name = d['mapped_values']['name']['text_value'].join()
			form.phone = d['mapped_values']['phone']['text_value'].join().to_i
			form.save
				
			end
			id+=1
		end