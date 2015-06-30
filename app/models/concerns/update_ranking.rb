module UpdateRanking
  extend ActiveSupport::Concern

  included do
    def self.update_ranking(properties)
      rankings = []
      properties.each do |property|
        rankings << new(property)
      end
      self.transaction do
        self.delete_all
        self.import(rankings)
      end
    end
  end
end