# == Schema Information
# Schema version: 20110228063114
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :name, :email
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates_presence_of :name, :email
	validates_format_of   :email, :with => email_regex
	validates_uniqueness_of :email, :case_sensitive => false
	
	validates :name, :presence 	 => true,
									 :length   	 => { :maximum => 50 }
									 
	validate :email, :presence   => true,
									 :format   	 =>  { :with => email_regex } ,
									 :uniqueness =>  { :case_sensitive => false }
end
