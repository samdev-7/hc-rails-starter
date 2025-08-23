# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  avatar       :string           not null
#  display_name :string           not null
#  first_name   :string           not null
#  is_banned    :boolean          default(FALSE), not null
#  last_name    :string           not null
#  role         :integer          default("user"), not null
#  timezone     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slack_id     :string           not null
#
class User < ApplicationRecord
  enum :role, { user: 0, admin: 1 }

  validates :avatar, :slack_id, :display_name, :timezone, :first_name, :last_name, presence: true
  validates :role, presence: true
  validates :is_banned, inclusion: { in: [ true, false ] }
end
