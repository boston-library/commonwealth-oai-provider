# frozen_string_literal: true

# NOTE: This is Needed so we don't have to actually use ActiveRecord
# Currently when eager loading the app it breaks due to some internal blacklight classes being loaded (Bookmarks)
# Using this (Although hacky) class definition we can circumvent that problem

class ApplicationRecord
  def self.belongs_to(*args); end
  def self.validates(*args); end
  def self.serialize(*args); end
end
