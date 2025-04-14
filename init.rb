require_relative 'infra/db'
require_relative 'models/cliente'

#dados = Infra::Db.new.execute("SELECT * FROM clientes", [])

#puts dados.first.inspect

cliente = Models::Cliente.new