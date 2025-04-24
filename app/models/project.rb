class Project < ApplicationRecord
  paginates_per 10
  enum :status, [:pending, :active, :completed, :archived]

  validates :name, presence: true, length: { maximum: 100 }
  validates :description, length: { maximum: 5000 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  scope :active, -> { where(status: statuses[:active]) }
  scope :completed, -> { where(status: statuses[:completed]) }

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end
