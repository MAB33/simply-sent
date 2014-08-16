class Card < ActiveRecord::Base
	belongs_to :user
	belongs_to :card_template
	has_and_belongs_to_many :addresses
	has_many :addresses_cards, dependent: :destroy

	validates_presence_of :card_template_id, :name, :message
	# validates_uniqueness_of :name
	validates_length_of :message, :maximum => 2245, :message => "is too long"


	before_save :strip_whitespace

	private

	def strip_whitespace
		self.name = self.name.strip unless self.name.blank?
	end

end