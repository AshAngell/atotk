module AtoTk
  module Common

    WEIGHTS = {8 => [10, 7, 8, 4, 6, 3, 5, 1], 9 => [10, 7, 8, 4, 6, 3, 5, 2, 1], 11 => [10, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19]}

  end
end

# Require everything from the atotk directory.
Dir[File.expand_path('../atotk/*.rb', __FILE__)].each{|f| require f }
