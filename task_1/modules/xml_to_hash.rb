# frozen_string_literal: true

module XmlToHash
  def convert_to_hash(document)
    id_value = document.at_css("//HotelReservationID[@ResID_Type='10']").attr('ResID_Value')
    external_id_value = document.at_css("//HotelReservationID[@ResID_Type='16']").attr('ResID_Value')
    res_status = document.at_css('//HotelReservation').attr('ResStatus')
    rate_plan = document.at_css('//RatePlanDescription').text.strip
    services = document.xpath('//Services/Service').collect { |service| service.text.strip }.join(', ')
    { id: id_value,
      external_id: external_id_value,
      state: res_status,
      rate_plan: rate_plan,
      services: services }
  end
end
