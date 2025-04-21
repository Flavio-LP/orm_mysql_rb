require_relative 'infra/db'
require_relative 'models/cliente'
require_relative 'models/fornecedor'
require 'terminal-table'

#dados = Infra::Db.new.execute("SELECT * FROM clientes", [])

#puts dados.first.inspect

#cliente = Models::Cliente.new


clientes = Models::Cliente.todos


rows = clientes.map do |cliente|
   [cliente.id, cliente.nome, cliente.telefone, cliente.cpf]
end

table = Terminal::Table.new(
    :headings => ['ID', 'Nome', 'Telefone', 'CPF'],
    :rows => rows
    
)

puts table



fornecedores = Models::Fornecedor.todos


rows = fornecedores.map do |fornecedores|
   [fornecedores.id, fornecedores.nome, fornecedores.telefone, fornecedores.cnpj, fornecedores.endereco ]
end

table = Terminal::Table.new(
    :headings => ['id', 'Nome', 'Telefone', 'cnpj','endereco'],
    :rows => rows
    
)

puts table