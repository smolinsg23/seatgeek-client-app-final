module StatisticsHelper
  def buy_now_bid_over_time(bid_id)
    line_chart "/charts/buy_now_bid_over_time?bid_id=#{bid_id}", library: {
      title: {text: 'bids over time by hour', x: -20},
      yAxis: {
          crosshair: true,
          title: {
              text: 'bid count'
          }
      },
      xAxis: {
          crosshair: true,
          title: {
              text: 'hour'
          }
      }
  }
end
end
