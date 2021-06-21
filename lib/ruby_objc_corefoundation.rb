# frozen_string_literal: true

require 'ffi'
require 'ruby_objc_corefoundation/version'
module RubyObjcCorefoundation
  extend FFI::Library
  ffi_lib '/Users/rishi/ruby_objc_corefoundation/CFPrefs/DerivedData/CFPrefs/Build/Products/Debug/CFPrefs'

  attach_function :GetPreferencesValue, %i[string string string string string], :string
end

p RubyObjcCorefoundation.GetPreferencesValue('idleTime', 'com.apple.screensaver', 'rishi', 'MacBook-Pro-2.local', 'local')
p RubyObjcCorefoundation.GetPreferencesValue('tokenRemovalAction', 'com.apple.screensaver', 'rishi', 'MacBook-Pro-2.local', 'local')
