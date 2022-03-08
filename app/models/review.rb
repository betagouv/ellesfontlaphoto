class Review < ApplicationRecord
  belongs_to :help
  NOTES = [[1,1],[2,2],[3,3],[4,4],[5,5]]
  # NOTES = [1,2,3,4,5]
end
