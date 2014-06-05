class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :carteira
      t.string :telefone
      t.string :endereco

      t.timestamps
    end
  end
end
