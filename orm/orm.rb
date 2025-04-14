require 'json'
require 'byebug'


module ORM
    module ORM_MYSQL
        def self.included(base)
            tabela = base.to_s.split('::').last.downcase + "s"
        end

end