# frozen_string_literal: true
module MediaTools
  class MediaStatResult < FFI::Struct
    layout :size,    :int64,
           :frames,  :uint64,
           :width,   :uint32,
           :height,  :uint32,
           :dur_num, :uint32,
           :dur_den, :uint32,
           :mime,    [:uint8, 33]

    # Convert the MediaStatResult into a hash.
    # This is different from simply MediaStatResult#[] in a couple of ways:
    #   * It calculates the duration as a floating point number, rather than returning a fraction.
    #   * It reads the MIME type as a string out of the struct.
    # @return [Hash]
    def to_h
      {
        size:     self[:size],
        frames:   self[:frames],
        width:    self[:width],
        height:   self[:height],
        duration: self[:dur_num] / self[:dur_den],
        mime:     self[:mime].to_ptr.read_string
      }
    end

    def to_s
      to_h.to_s
    end
  end
end
