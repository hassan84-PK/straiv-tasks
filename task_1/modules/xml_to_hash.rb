module XmlToHash
  def convert_to_hash(document)
    { id: document.at_css("//HotelReservationID[@ResID_Type='10']").attr("ResID_Value"),
      external_id: document.at_css("//HotelReservationID[@ResID_Type='16']").attr("ResID_Value"),
      state: document.at_css("//HotelReservation").attr("ResStatus"),
      rate_plan: document.at_css("//RatePlanDescription").text.strip,
      services: document.xpath("//Services/Service").collect { |service| service.text.strip }.join(', ')
    }
    #need to handle a case if services is empty
    
end
end
