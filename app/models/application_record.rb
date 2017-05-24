# * Name: Alex McBride
# * Date: 17/05/2017
# * Project: Future Prospects
# * Abstract class that all models inherit from.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
