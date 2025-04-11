require 'httparty'
require 'json'
require 'colorize'
require 'terminal-table'
require 'ruby-progressbar'

def display_banner
  banner = <<~BANNER
    ╔══════════════════════════════════════════════╗
    ║       🌟 LIEP BOT - Waitlist Automator       ║
    ║   Automate your Leippass waitlist signup!    ║
    ║  Developed by: https://t.me/sentineldiscus   ║
    ╚══════════════════════════════════════════════╝
  BANNER
  puts banner.colorize(:cyan)
end

def generate_username
  (0...8).map { ('a'..'z').to_a[rand(26)] }.join
end

def generate_temp_email
  name = (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  "#{name}.guerilla@gmail.com"
end

def display_results(data, status_code, request_number)
  table = Terminal::Table.new(title: "Hasil Pendaftaran Waitlist ##{request_number}") do |t|
    t << ['Parameter', 'Nilai']
    t << :separator
    t << ['Nama Pengguna', data['username']]
    t << ['Email', data['email']]
    t << ['Kode Referal', data['referredBy']]
    t << ['Status Register', status_code == 200 ? 'Sukses' : 'Gagal']
  end
  puts table
rescue StandardError => e
  puts "Gagal menampilkan hasil: #{e.message}".colorize(:red)
end

def join_waitlist
  display_banner
  puts "Memulai proses pendaftaran waitlist".colorize(:light_blue)

  begin
    print 'Masukkan jumlah request yang ingin dilakukan: '
    request_count = gets.chomp.to_i
    print 'Masukkan kode referal (contoh: Yuurichan): '
    referral_code = gets.chomp
  rescue StandardError
    puts 'Jumlah request harus berupa angka!'.colorize(:red)
    return
  end

  if request_count <= 0
    puts 'Jumlah request harus lebih dari 0!'.colorize(:red)
    return
  end

  url = 'https://www.leippass.xyz/api/waitlist'

  headers = {
    'accept' => '*/*',
    'accept-encoding' => 'gzip, deflate, br, zstd',
    'accept-language' => 'id-ID,id;q=0.9,ja-ID;q=0.8,ja;q=0.7,en-ID;q=0.6,en;q=0.5,en-US;q=0.4',
    'content-type' => 'application/json',
    'origin' => 'https://www.leippass.xyz',
    'priority' => 'u=1, i',
    'referer' => 'https://www.leippass.xyz/waitlist?ref=earlyaccess',
    'sec-ch-ua' => '"Chromium";v="130", "Mises";v="130", "Not?A_Brand";v="99"',
    'sec-ch-ua-mobile' => '?1',
    'sec-ch-ua-platform' => '"Android"',
    'sec-fetch-dest' => 'empty',
    'sec-fetch-mode' => 'cors',
    'sec-fetch-site' => 'same-origin',
    'user-agent' => 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Mobile Safari/537.36'
  }

  progressbar = ProgressBar.create(total: request_count, format: '%t: |%B| %p%% %e', title: 'Memproses pendaftaran')

  request_count.times do |i|
    puts "Mengirim permintaan ke-#{i + 1}".colorize(:light_blue)

    begin
      data = {
        'completedTasks' => %w[follow retweet tagFriends referral],
        'email' => generate_temp_email,
        'referredBy' => referral_code,
        'username' => generate_username
      }

      response = HTTParty.post(url, body: data.to_json, headers: headers)

      if response.code == 200
        puts "Berhasil gabung waitlist untuk request ke-#{i + 1}".colorize(:green)
        display_results(data, response.code, i + 1)
      else
        puts "Gagal gabung waitlist untuk request ke-#{i + 1}. Kode status: #{response.code}".colorize(:red)
        display_results(data, response.code, i + 1)
      end
    rescue StandardError => e
      puts "Error pada request ke-#{i + 1}: #{e.message}".colorize(:red)
    end

    if i < request_count - 1
      delay = rand(10.0..15.0)
      puts "Menunggu #{format('%.2f', delay)} detik sebelum request berikutnya...".colorize(:yellow)
      sleep(delay)
    end

    progressbar.increment
  end
end

join_waitlist if __FILE__ == $PROGRAM_NAME
