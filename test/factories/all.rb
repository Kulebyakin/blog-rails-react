FactoryBot.define do
  factory :post do
    title { "Пост о разработке" }
    body { "Информация о разработке" }

    trait :about_development do
      title { "Пост о разработке" }
      body { "Информация о разработке" }
      association :topic, factory: [:topic, :development]
    end
    trait :about_administration do
      title { "Пост об администрировании" }
      body { "Информация об администрировании" }
      association :topic, factory: [:topic, :administration]
    end
    trait :about_design do
      title { "Пост о дизайне" }
      body { "Информация о дизайне" }
      association :topic, factory: [:topic, :design]
    end
    trait :about_management do
      title { "Пост о менеджменте" }
      body { "Информация о менеджменте" }
      association :topic, factory: [:topic, :management]
    end
    trait :about_marketing do
      title { "Пост о маркетинге" }
      body { "Информация о маркетинге" }
      association :topic, factory: [:topic, :marketing]
    end
    trait :about_science do
      title { "Пост о науке" }
      body { "Информация о науке" }
      association :topic, factory: [:topic, :science]
    end
  end

  factory :topic do
      trait :development do
        add_attribute(:alias) { "development" }
        title { "Разработка" }
      end
      trait :administraition do
        add_attribute(:alias) { "administration" }
        title { "Администрирование" }
      end
      trait :design do
        add_attribute(:alias) { "design" }
        title { "Дизайн" }
      end
      trait :management do
        add_attribute(:alias) { "management" }
        title { "Менеджмент" }
      end
      trait :marketing do
        add_attribute(:alias) { "marketing" }
        title { "Маркетинг" }
      end
      trait :science do
        add_attribute(:alias) { "science" }
        title { "Научпоп" }
      end
  end
end