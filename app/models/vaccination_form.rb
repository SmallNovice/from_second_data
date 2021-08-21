class VaccinationForm < ApplicationRecord
	def self.build(values)
			form = VaccinationForm.new(
			company:	values['company']['text_value'].join(),
			number: values['number']['text_value'].join(),
			nonumber: values['nonumber']['text_value'].join(),
			name: values['name']['text_value'].join(),
			phone: values['phone']['text_value'].join().to_i)	

  end

  private

  def self.form_id
   	@form_id = 86
  end
end
