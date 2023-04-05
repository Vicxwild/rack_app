# frozen_string_literal: true

class TimeFormatter
  TIME_FORMATS = {
    'year' => '%Y',
    'month' => '%m',
    'day' => '%d',
    'hour' => '%H',
    'minute' => '%M',
    'second' => '%S'
  }

  def initialize(formats)
    @formats = formats.split(',')
    @output_format = []
    @unknown_time_foramt = []
  end

  def call
    @formats.each do |format|
      if TIME_FORMATS[format]
        @output_format << TIME_FORMATS[format]
      else
        @unknown_time_foramt << format
      end
    end
  end

  def success?
    @unknown_time_foramt.empty?
  end

  def time_string
    Time.now.strftime(@output_format.join('-'))
  end

  def invalid_string
    "Unknown time format #{@unknown_time_foramt}" unless success?
  end
end
