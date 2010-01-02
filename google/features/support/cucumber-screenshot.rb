module Screenshots
  if Cucumber::OS_X
    def take_screenshot(file)
      make_directory 'screenshots'
      `screencapture -t png -T 0 screenshots/#{file}.png`
      embed("screenshots/#{file}.png", "image/png")
    end
  else # Other platforms...
    def take_screenshot(id)
      STDERR.puts "Sorry - no screenshots on your platform yet."
    end
  end
  
  def make_directory(path)
    Dir.mkdir(path) unless File.exists?(path) && File.directory?(path)
  end
  
end