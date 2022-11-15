class Book < ApplicationRecord

    # 販売状態
    enum sales_status:{
        reservation:  0,  # 予約受付
        now_on_sale:  1,  # 現在販売中
        end_of_print: 2,  # 販売終了
    }


    scope :costly, -> {where("price > ?", 3000)}
    scope :wrtten_about, ->(theme) {where("name like ?", "%#{theme}%")}

    belongs_to :publisher
    has_many :book_authors
    has_many :authors, through: :book_authors

    validates :name, presence: true
    validates :name, length:{maximum: 25}
    validates :price, numericality: {greater_than_or_equal_to: 0}

    before_validation do
        self.name = self.name.gsub(/Cat/) do |matched|
            "lovely #{matched}"
        end
    end

    after_destroy :if => :high_price? do
        Rails.logger.warn "Book is high price Deleted: #{self.attributes}"
        Rails.logger.warn "Please Cheack"
    end

    def high_price?
        price >= 5000
    end
end
