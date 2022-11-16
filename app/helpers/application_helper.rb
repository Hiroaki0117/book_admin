module ApplicationHelper
    def to_hankaku(str)
        str.tr("A - Z a - z", "A-Z a-z")
    end
end
