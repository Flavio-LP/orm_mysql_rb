require_relative 'infra/db'

dados = Infra::Db.new.execute("SELECT * FROM clientes", [])

puts dados.first.inspect