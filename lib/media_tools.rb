# frozen_string_literal: true
require_relative 'media_tools/media_stat_result'
require_relative 'media_tools/media_tools_lib'
module MediaTools
  # noinspection RubyResolve
  # @return [Hash]
  def self.stat(path)
    result = MediaStatResult.new
    result_code = MediaToolsLib.mediastat_stat(path, result)

    if result_code != :success
      raise MediaToolsError, "result code: #{result_code}"
    end

    result.to_h
  end

  # noinspection RubyResolve
  # @return [Symbol]
  def self.generate_thumb(input, time, output)
    result_code = MediaToolsLib.mediathumb_generate_thumb(input, time.truncate(2), output)

    if result_code != :success
      raise MediaToolsError, "result code: #{result_code}"
    end

    result_code
  end
end

