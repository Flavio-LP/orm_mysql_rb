require_relative 'infra/db'
require_relative 'models/cliente'
require_relative 'models/fornecedor'
require 'terminal-table'

#dados = Infra::Db.new.execute("SELECT * FROM clientes", [])

#puts dados.first.inspect

#cliente = Models::Cliente.new

=begin

clientes = Models::Cliente.todos


rows = clientes.map do |cliente|
   [cliente.id, cliente.nome, cliente.telefone, cliente.cpf]
end

table = Terminal::Table.new(
    :headings => ['ID', 'Nome', 'Telefone', 'CPF'],
    :rows => rows
    
)

puts table
=end


fornecedores = Models::Fornecedor.todos


rows = fornecedores.map do |cliente|
   [fornecedores.id, fornecedores.nome, fornecedores.telefone, fornecedores.cnpj]
end

table = Terminal::Table.new(
    :headings => ['ID', 'Nome', 'Telefone', 'cnpj'],
    :rows => rows
    
)

puts table