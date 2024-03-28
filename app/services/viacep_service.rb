class ViacepService
  include HTTParty
  base_uri 'https://viacep.com.br/ws'

  def self.find_address(cep)
    response = get("/#{cep}/json")
    return nil unless response.success?
    
    JSON.parse(response.body)
  end
end