class Blog < ActiveRecord::Base
  validates :title, presence: true
  validates :body , presence: true

  has_many :documents, as: :uploadable

  accepts_nested_attributes_for :documents

  def documents_attributes=(document_ids)
    self.documents = Document.where('id in (?)', document_ids)
  end
end
