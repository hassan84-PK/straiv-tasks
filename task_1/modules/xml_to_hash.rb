# frozen_string_literal: true

module XmlToHash
  class << self
    def convert_to_hash(document)
      id_value = get_hotel_reservation_value(document, 10)
      external_id_value = get_hotel_reservation_value(document, 16)
      res_status = document.at_css('HotelReservation').attr('ResStatus')
      rate_plan = document.at_css('RatePlanDescription').text.strip
      services = document.xpath('//Services/Service').map { |service| service.text.strip }.join(', ')
      { id: id_value,
        external_id: external_id_value,
        state: res_status,
        rate_plan: rate_plan,
        services: services }
    end

    private

    def get_hotel_reservation_value(document, reservation_id)
      document.at_css("HotelReservationID[@ResID_Type='#{reservation_id}']").attr('ResID_Value')
    end
  end
end
