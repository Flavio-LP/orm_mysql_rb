require 'json'
require 'pry'
require_relative "../infra/db"

module ORM
    module ORM_MYSQL

        


        def self.included(base)

            base.extend(MetodosClass)

            unless base.instance_variable_defined?(:@nome_tabela)
                base.instance_variable_set(:@nome_tabela, base.tabela)
            end

            tabela = base.instance_variable_get(:@nome_tabela)

            dados = Infra::Db.new.execute("desc #{tabela}" , [])

            campos = dados.map {| dado | dado["Field"] }
            
            campos.each do |campo| 
                define_method ("#{campo}=") do |valor|
                  instance_variable_set("@#{campo}", valor)
                end

                define_method ("#{campo}") do
                    instance_variable_get("@#{campo}")
                end
            end
            
            
        
        end

        module MetodosClass
            def todos

                self.class_variable_set(:@@nome_tabela, @nome_tabela)
                tabela = self.class_variable_get(:@@nome_tabela)
                
                
                dados = Infra::Db.new.execute("SELECT * FROM #{tabela}", [])
                clientes = []
                
                
                
                dados.each do |dado|
                    obj = self.new
                    obj.methods.each do |metodo|
                      if metodo.end_with?("=")
                        key = metodo.to_s.chomp("=")
                        obj.send("#{key}=", dado[key])
                      end
                    end
                  clientes << obj
                end

                clientes
            end


            def tabela(nome=nil)
                unless nome.nil?
                  @@nome_tabela = nome
                  return
                end

                @nome_tabela = self.to_s.split("::").last.downcase + "s"
            end

        end
    end
end