class TemperatureConverterController < ApplicationController
  skip_before_action :verify_authenticity_token

  def convert
    xml_data = request.body.read
    xml_request = Nokogiri::XML(xml_data)
    fahrenheit = xml_request.at_xpath('.//Fahrenheit')&.text
    celsius = xml_request.at_xpath('.//Celsius')&.text

    if fahrenheit.present?
      celsius = (fahrenheit.to_f - 32) * 5.0/9.0
      xml_response = "<Celsius>#{celsius}</Celsius>"
    elsif celsius.present?
      fahrenheit = (celsius.to_f * 9.0/5.0) + 32
      xml_response = "<Fahrenheit>#{fahrenheit}</Fahrenheit>"
    else
      render xml: "Invalid request", status: :bad_request
      return
    end

    render xml: xml_response
  end
end
