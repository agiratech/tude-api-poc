class Api::ArimaController < ApplicationController
  def get_prediction_data
    data_set = JSON.parse(params[:data_set])["data"]
    avg = (data_set.inject(&:+)) / data_set.size
    data_set += [0,0]
    ts = data_set.to_ts
    ln  = data_set.size
    pacf = ts.pacf(ln, 'mle')
    set = []
    result = []
    trend_line = []
    data_set.each_with_index do |data,i|
      number = avg
      set.push(data)
      set.each_with_index do |a,index|
        number = index ==0 ?  0 : (a - set[index -1])
      end
      result << avg+number+pacf[i].round
      trend_line << pacf[i] + avg
    end

    # print result
    respond_to do |format|
       format.json { render json: { data: result, trend_line: trend_line}}
    end
  end
end
