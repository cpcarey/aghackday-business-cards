module ApplicationHelper

  def random_code(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    code = ''
    length.times { code << chars[rand(chars.size)] }
    code
  end

  def get_qr_code(url, size = 250)
    base = 'http://cpc2273-mac.wireless.rit.edu:3000/'
    'https://chart.googleapis.com/chart?cht=qr&chld=Q|0&chs=' + "#{size}" + 'x' + "#{size}" + "&chl=" + base + url
  end

end
