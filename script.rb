def stock_picker(stock)
  # calculate each buy and sell profit
  cal = stock.map.with_index do |buy_price, buy_index|
    stock.map.with_index do |profit, sell_index|
      if sell_index < buy_index
        # -1 if sell before buy
        profit = -1
      else
        profit = stock[sell_index] - stock[buy_index]
      end
    end
  end

  buy_day = cal.map { |result| result.max }.each_with_index.max[1]
  sell_day = cal[buy_day].each_with_index.max[1]
  [buy_day, sell_day]
end

stock = [17,3,6,9,15,8,6,1,10]
puts "The stock: #{stock}"
puts "Best days to buy and sell: #{stock_picker(stock)}"