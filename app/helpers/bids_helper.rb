module BidsHelper
  def bids_by_price
  line_chart bids_by_price_charts_path, library: {
      title: {text: 'bids by price', x: -20},
      yAxis: {
          crosshair: true,
          title: {
              text: 'Competitions count'
          }
      },
      xAxis: {
          crosshair: true,
          title: {
              text: 'price'
          }
      }
  }
end
  end


