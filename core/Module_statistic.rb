module Module_statistic

  def show

      puts top_reader

  end

  def top_reader(quantity = 2)
      mass = []
      hash = @masorder.inject(Hash.new(0)) { |h,v| h[v.reader.name] += 1; h }
    quantity.times do
      a = hash.max_by{|k,v| v}[0]
      mass.push(a)
      hash.delete_if{ |k,v| k == a }
    end
    return mass
  end

  def most_popular_books(quantity = 1)
      hash = @masorder.inject(Hash.new(0)) { |h,v| h[v.book.title] += 1; h }
      puts hash.inspect
      a = hash.max_by{|k,v| v}
      puts a[0]
  end


end
