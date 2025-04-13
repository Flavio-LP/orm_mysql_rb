require 'mysql2'
require 'yaml'
require 'erb'


module Infra
  class Db
      def initialize
        env = ENV["default"] || "dev"
        db_config = YAML.load(ERB.new(File.read("config/database.yml")).result, aliases: true)
        config = db_config[env]
        
          @client = Mysql2::Client.new(
            host: config["host"] ,
            username: config["username"] ,
            password: config["password"] ,
            database: config["database"] 
          )
        
      end

      def execute(sql,params)
        
        statement = @client.prepare(sql)
        result = statement.execute(*params)
        return result.to_a

      ensure 
        statement.close if statement
      end
  end
end
  