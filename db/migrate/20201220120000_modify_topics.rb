class ModifyTopics < ActiveRecord::Migration[6.0]
    def change
        add_index :topics, :alias, unique: true
        Topic.create :alias => "development", :title => "Разработка"
        Topic.create :alias => "administration", :title => "Администрирование"
        Topic.create :alias => "design", :title => "Дизайн"
        Topic.create :alias => "management", :title => "Менеджмент"
        Topic.create :alias => "marketing", :title => "Маркетинг"
        Topic.create :alias => "science", :title => "Научпоп"
    end
end