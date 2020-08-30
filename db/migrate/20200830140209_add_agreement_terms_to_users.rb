class AddAgreementTermsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :agreement_terms, :boolean, default: false
  end
end
