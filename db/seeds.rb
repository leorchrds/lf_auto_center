# db/seeds.rb

require 'csv'

# Limpa todos os registros existentes na tabela antes de popular
Vehicle.delete_all

# Caminho para o arquivo CSV
csv_file = '/home/leorchrd/fipe_cars.csv'

# Ler o arquivo CSV e armazenar os dados em csv_data
CSV.foreach(csv_file, headers: false) do |row|
  # Extrai as informações relevantes
  year_model = row[9] # Ano do modelo começa na décima posição
  avg_price_brl = row[10] # Preço médio em BRL começa na décima primeira posição
  brand = row[4] # Marca começa na quinta posição
  model = row[5] # Modelo começa na sexta posição
  fuel = row[6] # Combustível começa na sétima posição
  gear = row[7] # Tipo de câmbio começa na oitava posição
  engine_size = row[8] # Tamanho do motor começa na nona posição

  # Cria o registro de veículo no banco de dados
  Vehicle.create(
    brand: brand,
    model: model,
    fuel_type: fuel,
    gear: gear,
    engine_size: engine_size,
    year_model: year_model.to_i,
    avg_price_brl: avg_price_brl.to_f
  )
end
