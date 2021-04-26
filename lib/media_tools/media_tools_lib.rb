# frozen_string_literal: true
require 'ffi'
require_relative 'media_stat_result'

module MediaTools
  class MediaToolsError < StandardError
  end

  class MediaToolsLib
    extend FFI::Library
    ffi_lib 'mediatools'

    enum :mediastat_result_code, %i[success
                                    file_read_error
                                    find_stream_info_error
                                    find_best_stream_error
                                    decoding_context_error
                                    decode_error
                                    image_write_error
                                    frame_not_found_error
                                    format_validate_error
                                    duration_validate_error
                                    mime_type_error]

    attach_function :mediastat_stat, [:string, MediaStatResult.by_ref], :mediastat_result_code
    attach_function :mediathumb_generate_thumb, %i[string double string], :mediastat_result_code
  end
end

