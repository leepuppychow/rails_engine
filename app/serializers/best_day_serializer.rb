class BestDaySerializer <ActiveModel::Serializer

  attributes :best_day

  def best_day
    # binding.pry
    object.keys.first

  end


end
