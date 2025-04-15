require_relative "../orm/orm"

module Models

    class Fornecedor
        @nome_tabela = "fornecedores"
        include ORM::ORM_MYSQL

       
    end


end