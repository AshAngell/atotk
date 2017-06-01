require 'soap/wsdlDriver'

module AtoTk
  class Abn
    include AtoTk::Common

    def initialize(val)
      @value = val
      @digits = @value.to_digits if (@value.class == Fixnum || @value.class == Bignum)
      @wsdl = 'http://www.abn.business.gov.au/abrxmlsearch/ABRXMLSearch.asmx?WSDL'
    end

    def valid?
      return false if !(@value.class == Fixnum || @value.class == Bignum)
      return false if @digits.size != 11
      @digits[0] -= 1
      @digits.map.with_index {|digit, index| digit * WEIGHTS[@digits.size][index]}.inject {|sum, digit| sum + digit} % 89 == 0
    end

    alias_method :is_valid?, :valid?

    def to_s
      valid? ? '%s%s %s%s%s %s%s%s %s%s%s' % @digits : ''
    end

    def lookup(authentication_guid)
      if valid?
        soap_client = SOAP::WSDLDriverFactory.new(@wsdl).create_rpc_driver
        options = {:searchString => @value, :includeHistoricalDetails => 'n', authenticationGuid: authentication_guid}
        result = soap_client.ABRSearchByABN(options)
        {
            status: result['ABRPayloadSearchResults']['response']['businessEntity']['entityStatus']['entityStatusCode'],
            asic_number: result['ABRPayloadSearchResults']['response']['businessEntity']['ASICNumber'],
            name: {
                entity: result['ABRPayloadSearchResults']['response']['businessEntity']['mainName']['organisationName'],
                trading: result['ABRPayloadSearchResults']['response']['businessEntity']['mainTradingName']['organisationName']
            },
            type: result['ABRPayloadSearchResults']['response']['businessEntity']['entityType']['entityDescription'],
            state: result['ABRPayloadSearchResults']['response']['businessEntity']['mainBusinessPhysicalAddress']['stateCode'],
            postcode: result['ABRPayloadSearchResults']['response']['businessEntity']['mainBusinessPhysicalAddress']['postcode']
        }
      end
    end

  end
end